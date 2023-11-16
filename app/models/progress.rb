class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :course
  def self.ransackable_attributes(auth_object = nil)
    ["course_id", "created_at", "id", "pdf_watched", "pdf_watched_history", "percentage_completion", "updated_at", "user_id"]
  end
end
