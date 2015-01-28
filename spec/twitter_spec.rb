require 'twitter_api'quit

describe 'Twitter_API'  do 

  let(:twitter) {Twitter_API.new}

  it 'can connect to twitter through an API' do 
    expect(twitter.client.user("makersacademy")).not_to eq(nil)
  end

  context 'returning tweets' do

    before(:each) do
      twitter.get_trends(5)
    end

    it 'should return top five trends from twitter' do
      expect(twitter.trending.length).to eq(5)    
    end

    it 'should return tweets for the first trend' do
      fill_up_tweets
      expect(twitter.trending_tweets[0]).not_to be_empty
    end

    it 'should be able to remove & return item from the array' do
      fill_up_tweets
      twitter.return_and_remove(twitter.trending_tweets[0])
      expect(twitter.trending_tweets[0].length).to eq(4)
    end

    it 'should refresh content' do
      fill_up_tweets
      5.times { twitter.return_and_remove(twitter.trending_tweets[0]) }
      expect(twitter.trending_tweets.any? {|array| array.length == 0}).to be false
      expect(twitter.trending_tweets.length).to eq(5)
    end

  end
  
end

def fill_up_tweets
  twitter.get_tweets(twitter.trending[0])
end