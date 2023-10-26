class CoursesController < ApplicationController

  def index
    @courses=Course.all
  end
  def show
    puts "hi"
    @course=Course.find(params[:id])
    puts "#{@course.name}-----------------"
  end

  def new
    @course = Course.new
  end

  def create
    @user = current_user
    @course=Course.find(params[:course_id])
    if @user
        @course=Course.find(params[:course_id])
        puts "###################4444 #{@course.id}"
        if @user.courses.find_by(name:@course.name)==nil
          puts "true.................."
          @user.courses.create(name:@course.name,description:@course.description,price:@course.price)
          flash[:notice]="You successfully enroll this course !!"
          redirect_to "/users"
        else
          puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
          flash.now[:alert]="You already enroll this course !!"
          render "/courses/show"
        end
    else
      flash.now[:alert]="Please sign in first !!"
      render "/courses/show"
    end

  end


end
