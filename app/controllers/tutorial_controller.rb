class TutorialController < ApplicationController

  def run
    @input  = params["text"].to_s

    if @input.empty?
      @result = "Empty value, try again"
    elsif contains_evil_codes?(@input)
      @result = "You are a hacker"
    else
      @result = evaluate(@input)
    end
  end

  def contains_evil_codes?(input)
    evilcode = ["mkdir", "rmdir", "mydir", "rm", "ls", "-a", "ls -a", "cd", "pwd", "chroot", "cp", "-i", "cp -i",
      "`mkdir`", "`rmdir`", "`mydir`", "`rm`", "`ls`", "`-a`", "`ls -a`", "`cd`", "`pwd`", "`chroot`", "`cp`", "`-i`", "`cp -i`"]
    evilcode.each do |x|
      if input.include?(x)
        return true
      end
    end
    false
  end

  def evaluate_input(input)
    begin
      eval(input)
    rescue SyntaxError => syntax_error
      " The syntax is not correct : " + syntax_error.message
    rescue ArgumentError => argument_error
      "The argument is not correct: " + argument_error.message
    rescue StandardError => standard_error
      "Error running script: " + standard_error.message
    end
  end
end
