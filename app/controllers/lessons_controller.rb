class LessonsController < ApplicationController
	def index
		
	end

	# /lessons/:id
	def show
		@lesson = Lesson.find(params[:id])
		render json: @lesson, include: :steps
	end

	def first
        @first_lesson = Lesson.first
        render json: @first_lesson, include: :steps
	end
end

