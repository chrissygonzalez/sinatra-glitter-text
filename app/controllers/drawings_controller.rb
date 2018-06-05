class DrawingsController < ApplicationController
    get '/drawings' do
        @drawings = Drawing.where("user_id = ?", Helpers.current_user(session).id)
        erb :'/drawings/index'
    end
    
    get '/drawings/new' do
        erb :'drawings/new'
    end
    
    post '/drawings' do
        @drawing = Drawing.create(
            content: params[:content],
            title: params[:title],
            theme: Theme.find_by(name: params[:theme]),
            user_id: Helpers.current_user(session).id
            )
        redirect "/drawings/#{@drawing.id}"
    end
    
    get '/drawings/:id' do
        @drawing = Drawing.find(params[:id])
        if Helpers.current_user(session).id == @drawing.user_id
            erb :'/drawings/show'
        else
            redirect '/drawings'
        end
    end
    
    get '/drawings/:id/edit' do
        if !Helpers.logged_in?(session)
            redirect '/login'
        else
            @drawing = Drawing.find(params[:id])
            if @drawing.id == Helpers.current_user(session).id
                erb :'/drawings/edit'
            else
                redirect '/drawings'
            end
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
        @drawing = Drawing.find(params[:id])
        if Helpers.current_user(session).id == @drawing.user_id
            @drawing.destroy
            redirect '/drawings'
        else
            redirect "/drawings/#{@drawing.id}"
        end
    end
end
