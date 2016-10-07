class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://bettrcheddr.com/login'
    mail(
      to: @user.email,
      subject: 'Ready for some Cheese?'
    )
  end

  def notification_email(user)
    @user = user
    @url  = 'http://bettrcheddr.com/login'
    mail(
      to: @user.email,
      subject: 'Someone has reviewed your cheese!'
    )
  end
end
