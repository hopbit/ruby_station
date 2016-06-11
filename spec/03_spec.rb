require 'spec_helper'

describe "Methods" do
  it "has to define <<pluralize>> method" do
    expect(RubyStation.new).to respond_to("pluralize")
  end

  it "handles the 0 case" do
    result = RubyStation.new.pluralize(0, "cat")
    expect(result).to eq "no cats"
  end

  it "handles the 1 case" do
    result = RubyStation.new.pluralize(1, "dog")
    expect(result).to eq "1 dog"
  end

  it "handles the plural case" do
    result = RubyStation.new.pluralize(3, "bird")
    expect(result).to eq "3 birds"
  end
end
