class UsersController < ApplicationController
  def new
    
  end

  def login
    @user=User.find_by(username:params[:username],password:params[:password])
    if @user
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to '/'
    else
      flash[:errors] = ["User not found. Please, register!"]
      redirect_to "/users/new"
    end
  end

  def logout
    # session[:user_id] = nil
    reset_session  # because you forgot to remove :username !!!
    redirect_to '/users/new'
  end

  def create
    @user=User.create(username:params[:username],password:params[:password])
    flash[:errors] = ["Please, login now!"]
    # If using validations ... check that `@user.valid?` and `@user.errors`
    redirect_to '/users/new'
  end
end