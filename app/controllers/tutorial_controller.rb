class TutorialController < ApplicationController

  # attr_accessor :input, :result

  LESSONS = {
      '1' => Lesson.new(
          :title => "Lesson 1", :content => "Some Html"),
      '2' => Lesson.new(:title => "Lesson 2", :content => "Some Html"),
  }

  def start
   @lesson = LESSONS[params[:id]]
   # @title = @lesson.title
   # @content = @lesson.content

    #@lesson  = Lesson.order("id").page(params[:id])
    #puts ("Id page :#{@lesson}")
    #@title   = Lesson.pluck(:title)
    #@content = Lesson.pluck(:content)
    render "start"
  end


  def run
    @input  = params["text"].to_s

    if @input.empty?
      @result = "Digite o código no campo abaixo."
    elsif contains_evil_codes?(@input)
      @result = "O comando que você digitou não é válido neste tutorial!"
    else
      @result = evaluate_input(@input)
    end
    render "start"
  end

  def contains_evil_codes?(input)
    evil_code = ["mkdir", "rmdir", "mydir", "rm", "ls", "-a", "ls -a", "cd", "pwd", "chroot", "cp", "-i", "cp -i",
      "`mkdir`", "`rmdir`", "`mydir`", "`rm`", "`ls`", "`-a`", "`ls -a`", "`cd`", "`pwd`", "`chroot`", "`cp`", "`-i`", "`cp -i`"]
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
      "Ocorreu um erro ao rodar o script. Tente outra vez."
    end
  end
end
