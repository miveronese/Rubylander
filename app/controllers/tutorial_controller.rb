class TutorialController < ApplicationController

  # attr_accessor :input, :result

      #chalenge: random lessons:
     # lesson = Lesson.find(:first, :order => "RAND()")


  # def randon_id
  #   rand_id = rand(Lesson.count)
  #     if rand_id == 0
  #     rand_lesson = Lesson.first(:offset => rand(rand_id))
  #     else
  #     rand_lesson = Lesson.first(:conditions => [ "id = ?", rand_id])
  #     end
  # end

      
      #original code, before "random" challenge
      # link_to_id = params[:id]
      # lesson = Lesson.find_by_id(link_to_id.to_i)
      
      # Our first guest was... It didn't work :(
      #lesson = Lesson.order("RAND()").limit(1)

      # This other code only only returns crazy infos like: <Lesson::ActiveRecord_Relation:0x00000106a79660>
      # I thought we had a problem on our db/schema and almost add a new column called id.. :S
      #lesson = Lesson.where("id = ? ", params[:id]).limit(1)

      # But pluck returns an array! yeahhhhhh! 

      #When combined with sample, pluck will pick one single item from the array. 
      # And shuffle makes it happen randomically! :D :D

      # But, after doing thate, there were a problem with the views.
      # In the else part of the function, I've tried to call the title and the content
      #doing: @title = lesson_pluck.title, and so on. Didn't work.
      #So I've created a 3rd variable to found/grab the specific object we wanted, I mean,
      #the one with the id we've got randomically
      #It worked... But we still have a prlbema with our db...

      #Other option is to insert a sql command into the code
      #lesson = Lesson.order("RANDOM()").limit(1).first
      # if the code ends in limit(1), it will return a crazy number informing 
      #ActiveRecord Relation or smthing like that.
      #using first (or last), we grab the first element of the array

      def start
        render_lesson
      end

      def render_lesson
      # link_to_id = params[:id]
      lessons_array = Lesson.pluck(:id)
      puts "here is the array" + lessons_array.to_s
      lesson_rand = lessons_array.shuffle.sample
      puts "here is the sample:" + lesson_rand.to_s
      lesson = Lesson.find_by_id(lesson_rand)
      
      # lesson = Lesson.order("RANDOM()").limit(1).first
      # puts lessons_array
      # puts "eh isso aqui que ele pega" + lesson.to_s

      if lesson.nil? 
       render 'start' 
      else
       @title = lesson.title
       @content = lesson.content
       # puts "the id number taken randomically was " + lesson_rand.to_s
       render "lessons_" + lesson_rand.to_s
       # render "lessons_" + lesson.id.to_s

      end
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
    render_lesson
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
