class TasksController < ApplicationController
  def index
    if session[:user_id] 
      @tasks = Task.where(user_id:session[:user_id])
    else
      redirect_to '/users/new'
    end
  end

  def new
    
  end

  def create
    @task=Task.create(task:params[:task],due_date:params[:due_date],status:false,user:User.find(session[:user_id]))
    redirect_to '/'
  end

  def update
    @task = Task.find(params[:id])
    if @task.status == true
      @task.status = false
      @task.save
      redirect_to "/"
    else
      @task.status = true
      @task.save
      redirect_to "/"
    end
  end
end
