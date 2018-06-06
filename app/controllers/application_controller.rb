require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  register Sinatra::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end
  
  get '/' do
    if Helpers.logged_in?(session)
      redirect '/drawings'      
    else
      erb :index
    end
  end

end