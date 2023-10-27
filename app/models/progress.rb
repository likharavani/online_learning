class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :course
<<<<<<< HEAD

  def index
    @progress=Progress.all
  end

  def show
    @progress=Progress.find_by(course_id:params[:course_id],user_id:params[:user_id])
  end

=======
>>>>>>> f65986ae08aa1d0309df54d7c1fc348215a36a45
end
