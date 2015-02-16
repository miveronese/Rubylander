class CoursesController < ApplicationController

  def list_courses
    @courses = Course.all
    @course = Course.first
  end

end