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

class UserMapper
  def map_over_users(users)
    users.map do |user_hash|
      "#{user_hash[:name]} - #{self.is_adult(user_hash[:age])}"
    end
  end

  def is_adult(age)
    age >= 18 ? 'adult' : 'child'
  end
end

class ArticlePicker
  attr_reader :test_articles
  def initialize
    @test_articles = [
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
  end
  def pick(articles)
    filtered_articles = articles.select do |article_item|
      article_item[:featured] && article_item[:comments].size > 0
    end.map do |filtered_article_item|
      filtered_article_item[:title]
    end
  end
end

class CreditCalculator
  # 08_spec.rb
  def compute(credits, amount)
    credits.map do |name_and_events|
      name = name_and_events[:name]
      balance = name_and_events[:events].reduce(0) do |accumulator,event_item|
        action = event_item[:action]
        value = event_item[:value]
        value *= -1 if action == :spend_credits
        accumulator + value
      end
      [name, balance]
    end.select do |name_and_balance|
      name_and_balance[1] > amount
    end.reduce("") do | accumulator, item_with_balance_greater_than_amount |
      accumulator + item_with_balance_greater_than_amount[0] + " "
    end.chomp(' ')
  end
end