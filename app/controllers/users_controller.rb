class UsersController < ApplicationController
    get '/signup' do
        erb :'/users/create_user'
    end
    
    post '/signup' do
        if params[:username].empty? || params[:email].empty? || params[:password].empty?
            redirect '/signup'
        end
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])

        if @user.save
            session[:user_id] = @user.id
            redirect '/drawings'
        else
            redirect "/failure"
        end
        
        redirect '/drawings'
    end
    
    get '/login' do
        if Helpers.logged_in?(session)
            redirect '/'
        else
            erb :'/users/login'
        end
    end
    
    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/'
        else
            redirect '/login'
        end
    end
    
    get '/logout' do
        if Helpers.logged_in?(session)
            session.clear
            redirect '/'
        end
        redirect '/'
    end
end