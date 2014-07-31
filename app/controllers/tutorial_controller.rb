class TutorialController < ApplicationController

  # attr_accessor :input, :result


  # def lessons
  #   render "lessons"
  # end


  def start
    @lesson = params[:id]
    if @lesson.nil?
       render "start" 
    else
      render "lessons_" + @lesson
    end
  end


 # @lesson = params[:id]
  #   if @lesson.nil?
  #     @lesson = 1
  # end
    # @lesson = params[:id].to_i+1
    # if @lesson == nil
    #    render "start" 
    #    @lesson = 1
    # end



  def run
    @input  = params["text"].to_s

    if @input.empty?
      @result = "Digite o código no campo abaixo."
    elsif contains_evil_codes?(@input)
      @result = "Há! Você é um hacker!"
    else
      @result = evaluate_input(@input)
    end
    render "start"
  end


  def contains_evil_codes?(input)
    evil_code = ["`mkdir`", "`rmdir`", "`mydir`", "`rm`", "`ls`", "`-a`", "`ls -a`", "`cd`", "`pwd`", "`chroot`", "`cp`", "`-i`", "`cp -i`"]
    evil_code.map { |x| input.include?(x) }.include?(true)
  end

  def evaluate_input(input)
    begin
      eval(input)
    rescue SyntaxError => syntax_error
      "Ups! Você digitou errado. Veja o exemplo ao lado e tente de novo."
    rescue ArgumentError => argument_error
      "Parece que você cometeu um erro de argumento. Tente de novo!"
    rescue StandardError => standard_error
      "Ocorreu um erro. Tente outra vez."
    end
  end
end
