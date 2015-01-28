require 'sinatra/base'
require_relative '../lib/twitter_api.rb'

class Twee < Sinatra::Base

  TWITTER = Twitter_API.new
  
  get '/' do
    TWITTER.get_trends(5)
    fill_up_tweets
    @trends = TWITTER.trending
    @tweets = []
    i = 0
    5.times do
      @tweets << TWITTER.return_and_remove(TWITTER.trending_tweets[i])
      i += 1
    end
    erb :index
  end

  def fill_up_tweets
    TWITTER.get_trends(5)
    TWITTER.trending.each_with_index do |trend, index|
    TWITTER.get_tweets(TWITTER.trending[index])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
