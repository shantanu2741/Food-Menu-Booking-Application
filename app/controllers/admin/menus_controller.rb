class Admin::MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    org_id = current_user.organization_id
    @menus = Menu.where(organization_id: org_id).order(menu_date: :desc)
    @menu = Menu.new
  end

  def new
    @menu = Menu.new(menu_date: params[:date]) # pre-fill date if passed
  end

  # def create
  #   @menu = Menu.new(menu_params)
  #   @menu.organization_id = current_user.organization_id

  #   if @menu.save
  #     # Notify all employees in the same organization
  #     User.where(organization_id: current_user.organization_id, role: 'employee').find_each do |employee|
  #     MenuMailer.menu_created_email(employee, @menu).deliver_later

  #   redirect_to admin_dashboard_path, notice: 'Menu created and email sent to employees.'
  #   else
  #     @menus = Menu.where(organization_id: current_user.organization_id).order(menu_date: :desc)
  #     render :index
  #   end
  # end
def create
  @menu = Menu.new(menu_params)
  @menu.organization_id = current_user.organization_id

  if @menu.save
    # Notify all employees in the same organization
    User.where(organization_id: current_user.organization_id, role: 'employee').find_each do |employee|
      MenuMailer.menu_created_email(employee, @menu).deliver_now
    end

    redirect_to admin_dashboard_path, notice: 'Menu created and email sent to employees.'
  else
    @menus = Menu.where(organization_id: current_user.organization_id).order(menu_date: :desc)
    render :index
  end
end


  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    # @today_menu = Menu.find_by(menu_date: Date.current, organization_id: current_user.organization_id)
    @menu  = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to admin_dashboard_path, notice: 'Menu updated successfully.'
    else
      render :edit
    end
  end
# def edit
#   @response = Response.find(params[:id])
# end

# def update
#   @response = current_user.responses.find(params[:id])

#   if @response.update(response_params)
#     redirect_to employee_dashboard_path, notice: "Your preferences have been updated."
#   else
#     flash.now[:alert] = "There was an error updating your response."
#     render :edit
#   end
# end


  def destroy
    @today_menu = Menu.find(params[:id])
    @today_menu.destroy
    redirect_to admin_dashboard_path, notice: 'Menu deleted successfully.'
  end

  private

  def require_admin
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end

  def menu_params
    params.require(:menu).permit(:menu_date, :description)
  end
end
