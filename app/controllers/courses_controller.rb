# frozen_string_literal: true

# app/controllers/feedbacks_controller.rb
class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by(id: params[:id])
  end

  def new
    @course = Course.new
  end

  def download_certificate
    require 'prawn'
    certificate = Prawn::Document.new
    certificate.text "Name:#{current_user.name}"
    send_data(certificate.render, filename: "#{current_user.name}.pdf", type: 'application/pdf')
  end

  def update_user_progress
    @progress = Progress.find(params[:id])
    if @progress.pdf_watched_history.include?(params[:link]) == false
      @progress.pdf_watched_history.push(params[:link])
      @progress.pdf_watched += 1
      @progress.percentage_completion = ((@progress.pdf_watched * 100) / 3)
      @progress.save
    end
  end

  def add_course_to_user
    @user = current_user
    @course = Course.find(params[:course_id])
    if @user
      @course = Course.find(params[:course_id])
      if @user.courses.find_by(name: @course.name).nil?
        @user.courses << @course
        UserMailer.course_creation(@user, @course).deliver_now
        Progress.create(course_id: @course.id, user_id: @user.id)
        flash[:notice] = 'You successfully enroll this course !!'
        redirect_to '/users'
      else
        flash.now[:alert] = 'You already enroll this course !!'
        render '/courses/show'
      end
    else
      flash.now[:alert] = 'Please sign in first !!'
      render '/courses/show'
    end
  end
end
