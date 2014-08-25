class Lesson < ActiveRecord::Base
	
	belongs_to :tutorial
	has_many :steps	
end
