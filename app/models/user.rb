class User < ApplicationRecord


  has_and_belongs_to_many :courses, dependent: :destroy
  has_many :progress ,dependent: :destroy
  has_many :feedbacks
  has_one_attached :avatar

  after_create  :after_create_mail

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def after_create_mail
    UserMailer.welcome(self).deliver_now
  end
end
