# app/controllers/feedbacks_controller.rb
class Api::V1::FeedbacksController < ApiController
  before_action :authenticate_request
  protect_from_forgery with: :null_session

  def index
    feedbacks=Feedback.all
    render json: feedbacks
  end

  def new
    feedback=Feedback.new
  end

  def show
    feedback=Feedback.find_by(id: params[:id])
    render json: feedback
  end

  def create
    course = Course.find(params[:course_id])
    feedback = course.feedbacks.build(feedback_params)
    feedback.user = current_user
    if feedback.save
      render json: feedback, status: :created
    else
      render json: feedback.errors
    end
  end

  def destroy
    feedback=Feedback.find_by(id: params[:id])
    feedback.destroy
  end

  private
  def feedback_params
    params.permit(:description)
  end
end
