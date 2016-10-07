class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://bettrcheddr.com/login'
    mail(
      to: @user.email,
      subject: 'Ready for some Cheese?'
    )
  end
end
