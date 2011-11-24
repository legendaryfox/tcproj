class UsersController < ApplicationController
  before_filter :authenticate_user, :except => [:new, :create, :confirm, :confirmpage] #in app/helpers/sessions_helper.rb
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :check_confirmed_user, :only => [:show]
  
  
  def index
    @users = User.find_all_by_confirmed(1)
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
  
  def confirmpage
    @title = "Confirm User"
    @user = User.new
  end
  
  def confirm
    @title = "Confirm"
    #@user = params[:user]
    
    #first, check their passwords
    user = User.authenticate(params[:user][:email], params[:user][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Confirm User"
      @user = User.new
      render 'confirmpage'
    else
      # ok, they're a real user. Confirm them.
      
      #have to re-add their password...
      user.password = params[:user][:password]
      
      if user.confirm!
        redirect_to signin_path, :notice => "User confirmed. Please sign in."
      end
    end
    
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save 
      #successfully created new user
      
      #sign_in_user @user
      #redirect_to @user
      
      #force them to confirm
      redirect_to confirmpage_users_path, :notice => "User created. Please confirm your account here."
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
    
    def check_confirmed_user
      # checks if the TARGET user is confirmed.
      @user = User.find(params[:id])
      redirect_to(users_path) unless @user.confirmed?
    end
      
    

end
