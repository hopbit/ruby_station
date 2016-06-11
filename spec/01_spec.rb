require 'spec_helper'

describe "Strings and interpolation" do
  it "greets the user using his first name" do
    result = RubyStation.new.hello("John Brown")
    expect(result).to eq "Hello John!"
  end
end
