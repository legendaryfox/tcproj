class CboprofilesController < ApplicationController
  def show
    @cboprofile = Cboprofile.find(params[:id])
  end

  def edit
    @cboprofile = Cboprofile.find(params[:id])
    @title = "Edit CBO Profile"
  end

  def update
    @cboprofile = Cboprofile.find(params[:id])
    if @cboprofile.update_attributes(params[:cboprofile])
      redirect_to @cboprofile, :flash => { :success => "Profile updated." }
    else
      @title = "Edit User Profile"
      render 'edit'
    end
  end


end
