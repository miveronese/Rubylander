class TutorialController < ApplicationController

  def run
    @input = params["text"].to_s
    puts @input.inspect
    @result = eval(@input).to_s

  end

end
