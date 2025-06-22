class Employee::ResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_employee
  before_action :set_response, only: [:edit, :update]

  def edit
  end

  def update
    if @response.update(response_params)
      redirect_to employee_dashboard_path, notice: "Your response has been updated."
    else
      flash.now[:alert] = "There was an error updating your response."
      render :edit
    end
  end

  private

  def set_response
    @response = current_user.responses.find(params[:id])
  end

  def response_params
    params.require(:response).permit(:snacks, :dinner, :chapati_count)
  end

  def require_employee
    redirect_to root_path, alert: "Access denied." unless current_user.employee?
  end
end
