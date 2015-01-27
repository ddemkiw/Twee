require 'sinatra/base'

class Twee < Sinatra::Base
  get '/' do
    'Hello Twee!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
