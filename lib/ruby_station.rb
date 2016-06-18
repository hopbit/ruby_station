class RubyStation

  def hello(full_name)
    "Hello #{full_name.split(/ /).first}!"
  end

  def give_response(sentence)
    condition = sentence[-1]
    if condition == "?"
      result = "I don't know"
    else
      if condition == "!"
        result = "Don't shout at me"
      else
        result = "Yes, you are right"
      end
      result
    end
  end

  def pluralize(i, word)
    i == 0 ? "no cats" : "#{i} #{word}#{i > 1 ? 's' : ''}"
  end

end

class Article

  attr_reader :title, :content

  def initialize(given_title, given_content)
    @title = given_title
    @content = given_content
  end

  def slug()
    my_slug = @title.gsub(" ", "-").downcase
    puts my_slug
    my_slug
  end

end
