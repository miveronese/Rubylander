class Lesson < ActiveRecord::Base

	# belongs_to :courses
	has_many :steps, -> { order('id') }
end
