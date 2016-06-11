require 'spec_helper'

describe "Classes" do
  it "has to define <<Article> class" do
    expect(!!defined?(Article)).to eq true
  end

  it "allows to create a new article passing title and content" do
    article = Article.new("This is a title", "This is a content")
    expect(article.title).to eq "This is a title"
    expect(article.content).to eq "This is a content"
  end

  it "returns a slug for article" do
    article = Article.new("My cool article", "A bunch of words")
    expect(article.slug).to eq "my-cool-article"
  end

  it "returns a preview for article" do
    article = Article.new("First article", "This is some piece of text which is quite long.")
    expect(article.preview(20)).to eq "This is some piece o..."
  end
end
