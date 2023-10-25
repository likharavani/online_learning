class UsersController < ApplicationController
  layout "welcome"


  def index
    @courses=Course.all
  end
  def show
    puts "hi"
    @course=Course.find(params[:id])
  end

end
