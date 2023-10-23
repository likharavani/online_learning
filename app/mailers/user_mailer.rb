class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user

    mail to: @user.email, subject: "Thank you for signing up on our site."
  end
end
