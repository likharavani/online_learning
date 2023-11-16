# frozen_string_literal: true

# app/models/course.rb
class Course < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :pdfs, dependent: :destroy
  has_many :progress, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :name, uniqueness: true
  validates :price, :description, :image, presence: true

  after_create do
    self.update(image:'/assets/course_images/background.jpg')
  end

  def self.ransackable_attributes(auth_object = nil)
    %w(name)
  end
end
