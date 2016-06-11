class RubyStation
  def hello(full_name)
    first_name = full_name.split.first
    "Hello #{first_name}!"
  end

  def give_response(sentence)
    if sentence.end_with?("?")
      "I don't know"
    elsif sentence.end_with?("!")
      "Don't shout at me"
    else
      "Yes, you are right"
    end
  end

  def pluralize(number, noun)
    if number.zero?
      "no #{noun}s"
    elsif number == 1
      "1 #{noun}"
    else
      "#{number} #{noun}s"
    end
  end
end

class Article
  def initialize(title, content)
    @title = title
    @content = content
  end

  def title
    @title
  end

  def content
    @content
  end

  def slug
    @title.downcase.gsub(" ", "-")
  end

  def preview(length)
    "#{content.slice(0, length)}..."
  end
end

class ResponseParser
  def summarize(response)
    hits = response[:result][:hits]

    if hits.size > 0
      "Number of hits: #{hits.size}; best: #{hits.first[:value]}"
    else
      "There are no hits"
    end
  end
end
