Rails.application.routes.draw do
  get "home/index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions' # optional if you plan to customize login
  }

  namespace :admin do
    get 'dashboard', to: 'dashboard#index', as: :dashboard
    get 'responses/export', to: 'responses#export', as: 'export_responses'
    resources :menus, path: 'menus', only: [:index, :new, :create, :edit, :update, :destroy]
  end

  namespace :employee do
    get 'dashboard', to: 'dashboard#index', as: :dashboard
    post 'submit_response', to: 'dashboard#submit_response'
     resources :responses, only: [:edit, :update]
  end

  get  'magic_link', to: 'token_login#new',     as: :new_magic_link
  post 'magic_link', to: 'token_login#create',  as: :magic_link
  get  'token_login/:token', to: 'token_login#authenticate', as: :token_login

  authenticated :user do
    root to: redirect { |_, req|
      user = req.env['warden'].user
      case user&.role
        when "admin"
          "/admin/dashboard"
        when "employee"
          "/employee/dashboard"
        else
          "/404"  
        end
      }, as: :authenticated_root
  end

  unauthenticated do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end
end
