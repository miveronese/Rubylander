require 'rails_helper'

RSpec.describe "tutorial page", :type => :request do

  it "displays welcome message" do

    get "/"
    assert_select "h1", "Vamos aprender Ruby?"
    assert_select "input[type=?]", "submit"
  end


  it "should run user's commands" do

    post "/", :text=> "1+1"
    assert_select "textarea[id=\"text\"]", "2"
  end

  it "should show a message informing that the user are hacker" do

    post "/", :text=> "`ls`"
    assert_select "textarea[id=\"text\"]", "Há! Você é um hacker!"
  end

end