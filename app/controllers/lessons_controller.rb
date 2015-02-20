class LessonsController < ApplicationController

  def home
  	@courses = Course.all
  	@course = Course.first
  end

  def index
	@all_lessons = Lesson.all
	render json: @all_lessons, include: :steps
  end

  def show
	@lesson = Lesson.find(params[:id])
	render json: @lesson, include: :steps
  end

  def first
    @first_lesson = Lesson.first
    render json: @first_lesson, include: :steps
  end


end

