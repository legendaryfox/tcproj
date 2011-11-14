class UsersController < ApplicationController
  
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @cbos = @user.cbos.all
  end
  
  def new
    @title = "Sign up"
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

end
