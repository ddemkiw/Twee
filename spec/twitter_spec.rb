require 'twitter_api'

describe 'Twitter_API'  do 

  let(:twitter) {Twitter_API.new}

  # it 'can connect to twitter through an API' do 
  #   expect(twitter.client.user("makersacademy")).not_to eq(nil)
  # end

  # it 'should return top five trends from twitter' do
  #   twitter.get_trends
  #   expect(twitter.trending.length).to eq(5)    
  # end

  it 'should return tweets for the first trend' do
    twitter.get_trends
    twitter.get_tweets(twitter.trending[0], twitter.first_trend)
    expect(twitter.first_trend).not_to be_empty
  end
  
end