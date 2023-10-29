class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :course

  def index
    @progress=Progress.all
  end

  def show
    @progress=Progress.find_by(course_id:params[:course_id],user_id:params[:user_id])
  end

end
