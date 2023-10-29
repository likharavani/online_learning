class CoursesController < ApplicationController

  def index
    @courses=Course.all
    @progress=Progress.all
  end
  def show
    puts "hi"
    @course=Course.find(params[:id])
    puts "#{@course.name}-----------------"
  end

  def new
    @course = Course.new
  end
  
  def addition
    @progress = Progress.find_by(id: params[:id])

    if @progress
      @progress.pdf_watched += 1
      if @progress.save
        flash[:success] = "PDF watched count updated."
      else
        flash[:error] = "Failed to update PDF watched count."
      end
    else
      flash[:error] = "Progress record not found."
    end
  
    
 end


  def create
    @user = current_user
    @course=Course.find(params[:course_id])
    if @user
        @course=Course.find(params[:course_id])
        if @user.courses.find_by(name:@course.name)==nil
          @user.courses<<@course
          Progress.create(course_id:@course.id,user_id:@user.id)
          flash[:notice]="You successfully enroll this course !!"
          redirect_to "/users"
        else
          flash.now[:alert]="You already enroll this course !!"
          render "/courses/show"
        end
    else
      flash.now[:alert]="Please sign in first !!"
      render "/courses/show"
    end

  end


end
