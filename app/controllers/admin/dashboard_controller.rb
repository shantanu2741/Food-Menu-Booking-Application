class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    org_id = current_user.organization_id

    @today_menu = Menu.find_by(organization_id: org_id, menu_date: Date.current)
    @recent_menus = Menu.where(organization_id: org_id)
                        .where.not(id: @today_menu&.id)
                        .order(menu_date: :desc)
                        .limit(5)
    @today_responses = @today_menu ? @today_menu.responses.includes(:user) : []
    @total_responses = @today_responses.count
    @dinner_requests = @today_responses.count { |r| r.dinner == true }
    @total_chapatis = @today_responses.sum { |r| r.chapati_count.to_i }
    @previous_responses = Response
      .includes(:menu, :user)
      .where(menu: @recent_menus)
      .order("menus.menu_date DESC").limit(5)
  end

  private

  def require_admin
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end
end
