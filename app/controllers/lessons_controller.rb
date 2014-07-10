class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lessons_params)
      if @lesson.save
        # render :show
        # redirect_to(:back)
        redirect_to (@lesson)
      else
        render :new
      end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def edit
      @lesson = Lesson.find(params[:id])
  end

  def destroy
    Lesson.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  private
  def lessons_params
    params.require(:lesson).permit(:title, :text)
  end

end

