require 'sinatra/session'

class TaskController < Sinatra::Base

    enable :sessions


    set :default_content_type, 'application/json'


    # Create a new task
    post '/tasks/newtask' do

        request.body.rewind
        data = JSON.parse(request.body.read)
      
        task = Task.new(
          title: data['title'],
          description: data['description'],
          due_date: data['due_date'],
          user_id: data['user_id']
        )
      
        if task.save
          status 201
          task.to_json
        else
          status 422
          { errors: task.errors }.to_json
        end
        
    end

      put '/tasks/mytasks/update' do
        task = Task.find(params[:id])
        if task.update(completed: params[:completed])
          # json task
        else
          status 400
          json task.errors
        end
      end


    # Filter through tasks using the date the task was created
    get '/tasks/filter' do
        if params[:created_at].present?
          tasks = Task.where(created_at: params[:created_at])
          tasks.to_json
        else
          tasks = Task.all
          tasks.to_json
        end
    end

   put '/tasks/update/:user_id' do
    tasks = Task.find(data[:user_id])
    if task.update(completed: params[:completed])
       json task
    else
      status 400
      json task.errors
    end
  end

  get '/tasks/:user_id' do
    task = Task.where(user_id: params[user_id])
    if task
      task.to_json
    else
      status
    end
  end

 

  end


