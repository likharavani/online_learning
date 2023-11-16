class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user

    mail to: @user.email, subject: 'Thank you for signing up on our site.'
  end

  def course_creation(user,course)
    @user = user
    @course=course
    mail to: @user.email, subject: 'Thank you for adding the course'
  end
end
