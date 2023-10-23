class User < ApplicationRecord
  after_create  :after_create_mail

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def after_create_mail
    UserMailer.welcome(self).deliver_now
  end
end
