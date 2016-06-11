require 'spec_helper'

describe "Arrays and hashes" do
  it "extracts the number of hits and presents the best one (first)" do
    api_response = {
      result: {
        hits: [
          {
            value: "contract law"
          },
          {
            value: "family law"
          },
          {
            value: "property law"
          }
        ]
      }
    }

    expect(ResponseParser.new.summarize(api_response)).
      to eq "Number of hits: 3; best: contract law"
  end

  it "says <<There are no hits>> if there are no hits" do
    api_response = {
      result: {
        hits: []
      }
    }

    expect(ResponseParser.new.summarize(api_response)).to eq "There are no hits"
  end
end
