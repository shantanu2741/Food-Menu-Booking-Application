# app/mailers/menu_mailer.rb
class MenuMailer < ApplicationMailer
  def menu_created_email(user, menu)
    @user= user
    @menu = menu
    @user.generate_login_token!  # Generate fresh token

    mail(to: @user.email, subject: "Today's Menu is Live - Submit Your Preferences")
  end
end
