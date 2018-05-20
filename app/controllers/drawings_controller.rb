class DrawingsController < ApplicationController
    get '/drawings' do
        redirect '/'
    end
    
    get '/drawings/new' do
        erb :'drawings/new'
    end
    
    post '/drawings' do
        @drawing = Drawing.create(
            background_color: params[:background_color],
            background_effect: params[:background_effect],
            text_color: params[:text_color],
            outline_color: params[:outline_color],
            outline_width: params[:outline_width],
            content: params[:content],
            title: params[:title]
            )
        redirect "/drawings/#{@drawing.id}"
    end
    
    get '/drawings/:id' do
        @drawing = Drawing.find(params[:id])
        erb :'/drawings/show'
    end
end
