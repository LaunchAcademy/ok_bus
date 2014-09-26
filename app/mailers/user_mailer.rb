class UserMailer < ActionMailer::Base
  default from: "hislordship@okbus.com"

  def welcome_email(user)
    @user = user
    @url = root_path
    mail(to: @user.email, subject: "Welcome to OkBus!")
  end
end
