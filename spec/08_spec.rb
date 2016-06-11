require 'spec_helper'

describe "reduce" do
  it "returns a string containing names of users who have a credit balance greater than 40" do
    credits = [
      {
        name: "John",
        events: [
          { value: 45, action: :buy_credits },
          { value: 67, action: :spend_credits },
          { value: 12, action: :spend_credits },
          { value: 87, action: :buy_credits }
        ]
      },
      {
        name: "Tom",
        events: [
          { value: 36, action: :spend_credits }
        ]
      },
      {
        name: "Bob",
        events: [
          { value: 17, action: :buy_credits },
          { value: 43, action: :buy_credits },
          { value: 21, action: :spend_credits },
          { value: 7, action: :buy_credits }
        ]
      }
    ]

    result = CreditCalculator.new.compute(credits, 40)
    expect(result).to eq "John Bob"
  end
end
