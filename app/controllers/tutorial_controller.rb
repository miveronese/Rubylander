class TutorialController < ApplicationController

  def run
    @input = eval (params["text"].to_s)

  end

end
