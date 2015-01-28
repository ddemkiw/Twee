require 'twitter'

class Twitter_API

  attr_reader :client, :trending, :trending_tweets

  def initialize
    @client = create_client
    @trending = []
    @trending_tweets = []
    @number_of_tweets = 5
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
    trends = client.trends.take(@number_of_tweets)
    trends.each do |trend|
      trending << trend.name + " -rt"
    end
  end 

  def get_tweets(trend)
    current_tweets = []
    tweets = client.search(trend, lang: "en").take(@number_of_tweets)
    tweets.each do |tweet|
      current_tweets << tweet.text
    end
    trending_tweets << current_tweets
  end

  def return_and_remove(tweet_array)
    tweet_array.shift
  end 



end 