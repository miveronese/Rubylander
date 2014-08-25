class LessonsController < ApplicationController
	def index
		render json: Lesson.all.to_json(:include => :steps)
	end
end