class CoursesController < ApplicationController

  def list_courses
    @courses = Course.all
    @course = Course.first
  end

  def index
    @courses = Course.all
    @course = Course.first
    render json: @courses, include: {lessons: {include: :steps}} 
  end
end