class HomeController < ApplicationController
   layout "welcome"

  def index
    courses = Course.all
    feedbacks=Feedback.all
    render json: courses
  end
end
