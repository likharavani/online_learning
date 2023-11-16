# frozen_string_literal: true

# app/controllers/home_controller.rb
class HomeController < ApplicationController
   layout "welcome"

  def index
    @feedbacks=Feedback.all
    @q=Course.ransack(params[:q])
    @courses = @q.result(distinct: true)
  end
end
