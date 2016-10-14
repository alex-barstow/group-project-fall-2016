class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://bettercheddar.herokuapp.com/users/sign_in'
    mail(
      to: @user.email,
      subject: 'Ready for some Cheese?'
    )
  end

  def notification_email(user)
    @user = user
    @url  = 'http://bettercheddar.herokuapp.com/users/sign_in'
    mail(
      to: @user.email,
      subject: 'Someone has reviewed your cheese!'
    )
  end
end
