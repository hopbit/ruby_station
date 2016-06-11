require 'spec_helper'

describe "map" do
  it "generates user description" do
    users = [
      { name: "Bob", age: 3 },
      { name: "Kate", age: 21 },
      { name: "John", age: 5 }
    ]

    result = UserMapper.new.map_over_users(users)
    expect(result).to eq ["Bob - child", "Kate - adult", "John - child"]
  end
end
