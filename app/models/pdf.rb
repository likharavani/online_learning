class Pdf < ApplicationRecord
  belongs_to :course
  validates :name,:path,:course_id,presence:  true
end
