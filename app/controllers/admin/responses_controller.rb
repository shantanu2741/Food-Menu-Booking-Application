class Admin::ResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def export
    # Fetch only responses with either snacks or dinner marked as true
    @responses = Response.includes(:user)
                         .where(response_date: Date.current)
                         .where("snacks = ? OR dinner = ?", true, true)

    # Summary values
    @snacks_yes = @responses.where(snacks: true).count
    @dinner_yes = @responses.where(dinner: true).count
    @total_chapatis = @responses.sum(:chapati_count)

    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename=todays_responses_#{Date.today}.xlsx"
      }
    end
  end

  private

  def require_admin
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end
end
