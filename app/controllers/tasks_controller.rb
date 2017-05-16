class TasksController < ApplicationController
  def index
    if session[:user_id].nil?
      return redirect_to '/users/new'
    end
    @user = User.find(session[:user_id])
    @tasks = @user.tasks  # use the `has_many :tasks` helper
    # if session[:user_id] 
      # @tasks = Task.where(user_id:session[:user_id])
    # else
      # redirect_to '/users/new'
    # end
  end

  def new
    
  end

  def create
    # @task=Task.create(task:params[:task],due_date:params[:due_date],status:false,user:User.find(session[:user_id]))
    user = User.find(session[:user_id])
    user.tasks.create(task:params[:task],due_date:params[:due_date],status:false)  # use the `has_many :tasks` helper
    redirect_to '/'
  end

  def update
    @task = Task.find(params[:id])
    @task.status = !@task.status  #  toggle by saying value is the opposite of what it was
    @task.save
    redirect_to "/"
    # if @task.status == true
    #   @task.status = false
    #   @task.save
    #   redirect_to "/"
    # else
    #   @task.status = true
    #   @task.save
    #   redirect_to "/"
    # end
  end
end
