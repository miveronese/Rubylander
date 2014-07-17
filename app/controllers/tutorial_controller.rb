class TutorialController < ApplicationController

  def run
    begin
      @input  = params["text"].to_s
      @result = check_input(@input)
    rescue SyntaxError, NameError => syntax_name_error
      @result = " String doesn't compile: " + syntax_name_error.to_s
      puts      " _____String doesn't compile____: " + syntax_name_error.to_s
    rescue StandardError => standard_error
      @result = " Error running script: " + standard_error.to_s
      puts      " Error running script: " + standard_error.to_s
    end

  end


  def check_input(input)
   raise  "Empty value is not correct, please try again" if @input.nil? else eval(input)
  end

end
