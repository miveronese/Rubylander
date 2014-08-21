class Step < ActiveRecord::Base
	belongs_to :lesson
	serialize :result
end
