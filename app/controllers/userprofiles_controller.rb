class UserprofilesController < ApplicationController
  before_filter :authenticate_user, :except => [:new, :create] #in app/helpers/sessions_helper.rb
  before_filter :correct_userprofile_user, :only => [:edit, :update] 
  
  
  def show
    @userprofile = Userprofile.find(params[:id])
  end
  
  def edit
    @userprofile = Userprofile.find(params[:id]) #TODO: analagous way of passing/authenticating @userprofile as users_controller
    @title = "Edit User Profile"
  end
  
  def update
    @userprofile = Userprofile.find(params[:id]) #TODO: analagous way of passing/authenticating @userprofile as users_controller
    if @userprofile.update_attributes(params[:userprofile])
      redirect_to @userprofile, :flash => { :success => "Profile updated." }
    else
      @title = "Edit User Profile"
      render 'edit'
    end
  end
  
  private
  
    def correct_userprofile_user
      @user = Userprofile.find(params[:id]).user #slightly modified from correct_user in users_controller
      redirect_to(root_path) unless current_user?(@user)
    end
  
end
