class UserMailer < ApplicationMailer
  def magic_login_link(user)
    @user = user
    @url  = token_login_url(token: @user.login_token)
    mail(to: @user.email, subject: "Your Magic Login Link")
  end
end
