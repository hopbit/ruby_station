require 'spec_helper'

describe "select" do
  it "picks featured articles with at least one comment" do
    articles = [
      {
        title: "Awesome",
        featured: true,
        comments: [
          { content: "This is awesome" },
          { content: "Didn't know that!" }
        ]
      },
      {
        title: "Interesting article",
        featured: false,
        comments: [
          { content: "Good one" }
        ]
      },
      {
        title: "Article about weather",
        featured: true,
        comments: []
      }
    ]

    result = ArticlePicker.new.pick(articles)
    expect(result).to eq ["Awesome"]
  end
end
