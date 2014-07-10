class TutorialController < ApplicationController

  def run
    @input = params["text"]
  end

end
