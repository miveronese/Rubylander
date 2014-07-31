require 'rails_helper'

describe TutorialController do

  describe "contains_evil_codes?" do
    it  "should block evil code" do
      controller = TutorialController.new
      expect(controller.contains_evil_codes?("`mkdir`")).to be true
    end

    it "should allow code that is not evil" do
      controller = TutorialController.new
      expect(controller.contains_evil_codes?("BLA".downcase)).to be false
    end
  end

  # describe "evaluate" do
  #   it "should evaluate syntax error" do
  #     get :input
  #     expect(response).to raise_error(SyntaxError)
  #     # controller = TutorialController.new
  #     # expect(controller.evaluate("bla".case)).to be true
  #   end
  # end

  describe "evaluate_input" do
    it "returns an error message if input code has the wrong number of arguments" do
      controller = TutorialController.new
      expect(controller.evaluate_input("[1,2][]")).to eq("Parece que você cometeu um erro de argumento. Tente de novo!")
    end

    it "should evaluate if input code can be converted into string" do
      controller = TutorialController.new
      expect(controller.evaluate_input(" ['a','b','c'].inject(:+) ")).to eq("abc")
    end

    it "should evaluate if input code not contains an item" do
      controller = TutorialController.new
      expect(controller.evaluate_input("[1,2][1]")).not_to eq 3
    end

    it "should evaluate if an item is included in a given array" do
      controller = TutorialController.new
      expect(controller.evaluate_input("[1, 2]")).to include(1)
    end

    it "should evaluate if a given array contains an certain integer" do
      controller = TutorialController.new
      expect(controller.evaluate_input("1..10")).to cover(7)
    end

    it "should evaluate if input ends with a specific item" do
      controller = TutorialController.new
      expect(controller.evaluate_input("[0,1,2]")).to end_with 2
    end
  end

  #
  # THIS DOESN'T WORK!! RAILS WON'T LET ME!
  # describe "run" do
  #
  #   context "input is provided" do
  #
  #     before do
  #       @controller = TutorialController.new
  #       @controller.params["text"] = "1 + 1"
  #     end
  #
  #     it "sets @result to the result of evaluating the input" do
  #       @controller.run
  #       expect(@controller.result).to eq(2)
  #
  #     end
  #
  #   end
  #
  #   context "input is not provided" do
  #
  #   end
  #
  # end

end

