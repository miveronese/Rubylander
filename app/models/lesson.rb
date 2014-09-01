class Lesson < ActiveRecord::Base
	
	belongs_to :courses
	has_many :steps	
	# def to_s
	# "lesson " + self.id.to_s + " " + self.title + " " + self.description 
	# end
end
