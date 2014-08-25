class TutorialController < ApplicationController

  # attr_accessor :input, :result

  # /
  # shows the FIRST LESSON on the database
  def home
    @lesson_data = Lesson.all.to_json(:include => :steps).html_safe 
    #Lesson.find(params[:id] doesn't work )
    puts @lesson_data
  end

end
