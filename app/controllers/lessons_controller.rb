class LessonsController < ApplicationController
	def index
		
	end

	def show
		@lesson = Lesson.find(params[:id])
		render json: @lesson, include: :steps
	end
end