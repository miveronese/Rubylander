class Course < ActiveRecord::Base

	has_many :lessons, order: :id
end
