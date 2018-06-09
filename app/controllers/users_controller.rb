class UsersController < ApplicationController

    get '/signup' do
        erb :'/users/create_user'
    end
    
    post '/signup' do
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])

        if @user.errors.any?
            @errors = @user.errors.full_messages
            flash[:error] = @errors.join(". ")
            redirect '/signup'
        else            session[:user_id] = @user.id
            redirect '/drawings'
        end
        
        redirect '/drawings'
    end
    
    get '/login' do
        if Helpers.logged_in?(session)
            redirect '/drawings'
        else
            erb :'/users/login'
        end
    end
    
    post '/login' do
        if params[:username].empty? && params[:password].empty?
            flash[:error] = "Username and password can't be empty."
            redirect '/login'
        elsif params[:username].empty?
            flash[:error] = "Username can't be empty."
            redirect '/login'
        elsif params[:password].empty?
            flash[:error] = "Password can't be empty."
            redirect '/login'
        end
        
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/drawings'
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