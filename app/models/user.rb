# frozen_string_literal: true

# app/models/user.rb
class User < ApplicationRecord
  has_and_belongs_to_many :courses, dependent: :destroy
  has_many :progress, dependent: :destroy
  has_many :feedbacks
  has_one_attached :avatar

  after_create :after_create_mail

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
  ["created_at", "email", "encrypted_password", "id", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
  end

  private

  def after_create_mail
    UserMailer.welcome(self).deliver_now
  end
end
