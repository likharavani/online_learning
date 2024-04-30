
class Api::V1::HomeController < ApiController

   layout "welcome"

  def index
    courses = Course.all
    feedbacks=Feedback.all
    render json: courses
  end
end
