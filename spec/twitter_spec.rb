require 'twitter_api'

describe 'Twitter_API'  do 

  let(:twitter) {Twitter_API.new}

  # it 'can connect to twitter through an API' do 
  #   expect(twitter.client.user("makersacademy")).not_to eq(nil)
  # end

  it 'it should return top five trends from twitter' do
    twitter_api.get_trends
    expect(twitter.trends.length).to eq(5)    
  end

  
end