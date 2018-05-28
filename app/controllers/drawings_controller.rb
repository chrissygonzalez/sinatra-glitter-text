class DrawingsController < ApplicationController
    get '/drawings' do
        redirect '/'
    end
    
    get '/drawings/new' do
        erb :'drawings/new'
    end
    
    post '/drawings' do
        # binding.pry
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
end
