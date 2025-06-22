class HomeController < ApplicationController
  before_action :redirect_logged_in_user

  def index
  end

  private

  def redirect_logged_in_user
    return unless user_signed_in?

    if current_user.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to employee_dashboard_path
    end
  end
end
