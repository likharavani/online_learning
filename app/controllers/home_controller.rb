class HomeController < ApplicationController
   layout "welcome"

  def index
    @courses = Course.all
    @decide_destination_path=  user_signed_in? ? "form" : user_session_path
  end
end
