class Course < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :pdfs,dependent: :destroy
    has_many :progress,dependent: :destroy
    has_many :feedbacks,dependent: :destroy

    validates :name,uniqueness: true
    validates :price, :description, :image,presence: true
end
