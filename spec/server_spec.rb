require 'capybara/rspec'
require 'spec_helper'

feature 'Server' do 

  scenario 'displays tweets on homepage' do
    visit '/'
    expect(page).to have_selector('#tweet')
  end 

end 