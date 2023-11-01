class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :description,presence: true, length: {in: 10..100}
end
