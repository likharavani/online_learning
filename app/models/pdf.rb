class Pdf < ApplicationRecord
  belongs_to :course
  validates :name,:path,:course_id,presence:  true
  def self.ransackable_attributes(auth_object = nil)
    ["course_id", "created_at", "id", "name", "path", "updated_at"]
  end
end
