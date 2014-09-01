class Course < ActiveRecord::Base
	has_many :lessons

# def to_s
# 	"course " + self.id.to_s + " " + self.programming_language + " " + self.language
# end

end
