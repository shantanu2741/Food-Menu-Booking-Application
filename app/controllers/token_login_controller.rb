# class TokenLoginController < ApplicationController
#   def new
#     # Renders the form
#   end

#   def create
#     user = User.find_by(email: params[:email])

#     if user
#       user.generate_login_token!
#       UserMailer.magic_login_link(user).deliver_later
#       redirect_to new_user_session_path, notice: "A magic login link has been sent to your email."
#     else
#       flash.now[:alert] = "No user found with that email."
#       render :new
#     end
#   end

# #  def authenticate
# #   user = User.find_by(login_token: params[:token])

# #   if user && user.login_token_valid?
# #     class TokenLoginController < ApplicationController
# #   def new
# #     # Renders the form
# #   end

#   def create
#     user = User.find_by(email: params[:email])

#     if user
#       user.generate_login_token!
#       UserMailer.magic_login_link(user).deliver_later
#       redirect_to new_user_session_path, notice: "A magic login link has been sent to your email."
#     else
#       flash.now[:alert] = "No user found with that email."
#       render :new
#     end
#   end

#  def authenticate
#   user = User.find_by(login_token: params[:token])

#   if user && user.login_token_valid?
#     sign_in(user)  
#     user.clear_login_token!
#     redirect_to employee_dashboard_path, notice: "Logged in successfully."
#   else
#     redirect_to new_user_session_path, alert: "Invalid or expired link."
#   end
# end

# end

#     user.clear_login_token!
#     redirect_to employee_dashboard_path, notice: "Logged in successfully."
#   else
#     redirect_to new_user_session_path, alert: "Invalid or expired link."
#   end
# end

# end
class TokenLoginController < ApplicationController
  def new
    # Renders the form
  end

  def create
    user = User.find_by(email: params[:email])

    if user
      user.generate_login_token!
      UserMailer.magic_login_link(user).deliver_later
      redirect_to new_user_session_path, notice: "A magic login link has been sent to your email."
    else
      flash.now[:alert] = "No user found with that email."
      redirect_to root_path
    end
  end

  def authenticate
    user = User.find_by(login_token: params[:token])

    if user && user.login_token_valid?
      sign_in(:user,user)
      user.clear_login_token!
      redirect_to employee_dashboard_path, notice: "Logged in successfully."
    else
      redirect_to new_user_session_path, alert: "Invalid or expired link."
    end
  end
end

