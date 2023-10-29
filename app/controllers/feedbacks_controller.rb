# app/controllers/feedbacks_controller.rb
class FeedbacksController < ApplicationController
 
  def create
    @course = Course.find(params[:course_id])
    @feedback = @course.feedbacks.build(feedback_params)
    @feedback.user = current_user
    
    if @feedback.save
      redirect_to @course, notice: "Feedback submitted successfully."
    else
      render "courses/show"
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:description)
  end
end
