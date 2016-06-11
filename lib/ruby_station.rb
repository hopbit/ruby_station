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

class UserMapper
  def map_over_users(users)
    users.map do |user|
      if user[:age] < 18
        description = "child"
      else
        description = "adult"
      end

      "#{user[:name]} - #{description}"
    end
  end
end

class ArticlePicker
  def pick(articles)
    articles.select do |article|
      article[:featured] && article[:comments].size > 0
    end.map do |article|
      article[:title]
    end
  end
end

class CreditCalculator
  def compute(credits, threshold)
    credits.select do |user|
      total_for_user = user[:events].reduce(0) do |current_total, event|
        if event[:action] == :buy_credits
          current_total + event[:value]
        else
          current_total - event[:value]
        end
      end
      total_for_user > threshold
    end.map do |user|
      user[:name]
    end.join(" ")
  end
end
