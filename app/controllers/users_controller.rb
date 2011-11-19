class UsersController < ApplicationController
  before_filter :authenticate, :except => [:new, :create]
  before_filter 
  
  
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
    @user.build_userprofile
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save 
      sign_in_user @user
      redirect_to @user
    else
      @title = "Sign up"
      @user.build_userprofile(params[:user][:userprofile_attributes])
      render 'new'
    end

  end

end
