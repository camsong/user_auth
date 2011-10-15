class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_password_reset.subject
  #
  def send_password_reset user
    @user = user
    mail :to => user.email, :subject => "password reset"
  end
end
