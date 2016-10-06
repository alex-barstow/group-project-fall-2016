class UserMailer < ApplicationMailer
  default from: 'notifications@bettrcheddr.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://bettrcheddr.com/login'
    mail(to: @user.email, subject: 'Ready for some Cheese?')
  end
end
