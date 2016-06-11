require 'spec_helper'

describe "Conditionals" do
  it "says <<I don't know>> if question is asked" do
    result = RubyStation.new.give_response("How old are you?")
    expect(result).to eq "I don't know"
  end

  it "says <<Don't shout at me>> if sentence is a command" do
    result = RubyStation.new.give_response("Give me all your money!")
    expect(result).to eq "Don't shout at me"
  end

  it "says <<Yes, you are right>> in every other case" do
    result = RubyStation.new.give_response("I really like you.")
    expect(result).to eq "Yes, you are right"
  end
end
