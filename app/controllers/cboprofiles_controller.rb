class CboprofilesController < ApplicationController
  
  before_filter :authenticate_user, :only => [:nearby]
  
  def show
    @cboprofile = Cboprofile.find(params[:id])
    #@opportunities = @cboprofile.cbo.opportunities
  end

  def edit
    @cboprofile = Cboprofile.find(params[:id])
    @title = "Edit CBO Profile"
  end

  def update
    @cboprofile = Cboprofile.find(params[:id])
    
    if params[:cboprofile][:use_default_image] == "1"
      # they want to use the default image
      @cboprofile.cbo_avatar = nil
    end
    
    if @cboprofile.update_attributes(params[:cboprofile])
      redirect_to @cboprofile, :flash => { :success => "Profile updated." }
    else
      @title = "Edit User Profile"
      render 'edit'
    end
  end
  
  
  def nearby
    @distance = 50
    if params[:distance]
      @distance = params[:distance].to_f
    end
    
    @cboprofiles = Cboprofile.near_location(current_user.userprofile.latitude, current_user.userprofile.longitude, @distance)
    @title = "All CBOs within " + @distance.to_s + " miles of you."
  end


end
