class UserprofilesController < ApplicationController
  
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
  
  
end
