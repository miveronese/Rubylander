class TutorialController < ApplicationController

  # 
  # shows the FIRST LESSON on the database
  
  def home  

  # @lesson_data = Lesson.first.to_json(include: :steps).html_safe
   
    # @lesson_data = Lesson.find(params[:id]).to_json(include: :steps).html_safe
    # @lesson_data = Lesson.all.to_json(include: :steps).html_safe
    # TODO: include link for next lesson
    # TODO: if last lesson do something different
    # @lesson.steps.map {|step| { text: step.text, result: step.result }}
    # raise
  # @lesson_data = Lesson.all.to_json(include: :steps).html_safe
    end

end

