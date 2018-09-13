class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url = "mycatsite.com/new"
    mail(to: user.email, subject: 'Welcome to My Cat Rental Site')
  end
end
