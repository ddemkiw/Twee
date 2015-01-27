require 'twitter'

class Twitter_API

  attr_reader :client, :trending, :first_trend

  def initialize
    @client = create_client
    @trending = []
    @first_trend = []
  end

  def create_client
      Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end

  def get_trends
    trends = client.trends.take(5)
    trends.each do |trend|
      trending << trend.name
    end
  end 

  def get_tweets(trend, tweet_array)
    tweets = client.search(trend, lang: "en").take(5)
    tweets.each do |tweet|
      tweet_array << tweet.text
    end
  end

end 