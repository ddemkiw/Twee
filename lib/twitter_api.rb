require 'twitter'

class Twitter_API

  attr_reader :client, :trending, :trending_tweets, :number_of_trends

  def initialize
    @client = create_client
    @trending = []
    @trending_tweets = []
    @number_of_tweets = 5
    @number_of_trends = 5
  end

  def create_client
      Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end

  def get_trends(number_of_trends)
    trending.clear
    trends = client.trends.take(number_of_trends)
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
    clean_up
  end 

  def clean_up
    trending_tweets.delete_if { |i| i.empty? }
    refresh
  end

  def refresh
    refill_number = (number_of_trends - trending_tweets.length)
    get_trends(refill_number)
    
    trending.each_with_index do |trend, index|
      get_tweets(trending[index])
    end 

  end 


end 