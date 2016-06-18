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
  end

  def preview(size_of_preview)
    content.slice(0, size_of_preview).to_s + "..."
  end

end

class ResponseParser

  def summarize(api_response)
    api_hits = api_response[:result][:hits]
    api_hits_size = api_hits.size
    api_hits_size < 1 ? "There are no hits" : "Number of hits: #{api_hits_size}; best: #{api_hits.first[:value]}"
  end

end
