class HomeController < ApplicationController
   layout "welcome"
  def index
    @courses = Course.all
  end
end
