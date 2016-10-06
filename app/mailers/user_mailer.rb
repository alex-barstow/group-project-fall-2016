class UserMailer < ApplicationMailer
  default from: 'http://localhost:3000/'

  def welcome_email(user)
    @user = user
    @url  = 'http://bettrcheddr.com/login'
    mail(to: @user.email, subject: 'Ready for some Cheese?')
  end
end
