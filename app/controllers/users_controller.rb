class UsersController < ApplicationController
  before_filter :authenticate_user, :except => [:new, :create] #in app/helpers/sessions_helper.rb
  before_filter :correct_user, :only => [:edit, :update]
  
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    #@cbos = @user.cbos.all
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
  
  def edit
    #@user is passed implicitly via "correct_user" method below in private section
    @title = "Edit User"
  end
  
  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => { :success => "User updated." }
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  
  
  private
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    

end
