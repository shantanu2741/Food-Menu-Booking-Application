class Employee::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_employee

  def index
    @today_menu = Menu.find_by(menu_date: Date.current, organization_id: current_user.organization_id)
    @response = current_user.responses.find_or_initialize_by(response_date: Date.current, menu: @today_menu)
    @can_submit = @today_menu&.submission_open?
  end
  def submit_response
    @today_menu = Menu.find_by(menu_date: Date.current, organization_id: current_user.organization_id)

    unless @today_menu&.submission_open?
      redirect_to employee_dashboard_path, alert: "Submission time has ended." and return
    end

    @response = current_user.responses.find_or_initialize_by(response_date: Date.current, menu: @today_menu)

    if @response.update(response_params)
      redirect_to employee_dashboard_path, notice: "Your response has been recorded."
    else
      flash.now[:alert] = "There was an error saving your response."
      render :index
    end
  end

  private

  def response_params
    params.require(:response).permit(:snacks, :dinner, :chapati_count)
  end

  def require_employee
    redirect_to root_path, alert: "Access denied." unless current_user.employee?
  end
end
