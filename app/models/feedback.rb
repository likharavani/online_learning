class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :course_id,:user_id, presence:  true
  validates :description,presence: true, length: {in: 10..100}
end
