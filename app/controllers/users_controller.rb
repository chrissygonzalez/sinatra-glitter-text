class UsersController < ApplicationController
    get '/signup' do
        erb :'/users/create_user'
    end
    
    post '/signup' do
        binding.pry
        if params[:username].empty? || params[:email].empty? || params[:password].empty?
            redirect '/signup'
        end
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])

        if @user.save
            session[:user_id] = @user.id
            redirect '/tweets'
        else
            redirect "/failure"
        end
        
        redirect '/drawings'
    end
    
    get '/login' do
        # binding.pry
        if Helpers.logged_in?(session)
            redirect '/'
        else
            redirect '/signup'
        end
    end
end