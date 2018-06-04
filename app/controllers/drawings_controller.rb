class DrawingsController < ApplicationController
    get '/drawings' do
        erb :'/drawings/index'
    end
    
    get '/drawings/new' do
        erb :'drawings/new'
    end
    
    post '/drawings' do
        @drawing = Drawing.create(
            content: params[:content],
            title: params[:title],
            theme: Theme.find_by(name: params[:theme])
            )
        redirect "/drawings/#{@drawing.id}"
    end
    
    get '/drawings/:id' do
        @drawing = Drawing.find(params[:id])
        erb :'/drawings/show'
    end
    
    get '/drawings/:id/edit' do
        if !Helpers.logged_in?(session)
            redirect '/login'
        else
            @drawing = Drawing.find(params[:id])
            erb :'/drawings/edit'
        end
    end
    
    patch '/drawings/:id' do 
        if params[:title].empty? || params[:content].empty? || params[:theme].empty?
            redirect "/drawings/#{params[:id]}/edit"
        else
            @drawing = Drawing.find(params[:id])
            @drawing.update(title: params[:title], content: params[:content], theme: Theme.find_by(name: params[:theme]))
            @drawing.save
            erb :'drawings/show'
        end
    end
    
    get '/drawings/:id/delete' do
    end
end
