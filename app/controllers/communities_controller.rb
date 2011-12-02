class CommunitiesController < ApplicationController
  
  def new
    @title = "New Community"
    @community = Community.new
  end

  def show
    @community = Community.find(params[:id])
  end

  def index
    @communities = Community.all
    @title = "All Communities"
  end
  
  
  def my
    if signed_in_user?
      @communities = current_user.communities   
    elsif signed_in_cbo?
      @communities = current_cbo.communities
    else
      authenticate_user
    end
    
  end
  
  def nearby
    
    if signed_in_user?
      @distance = 50
      if params[:distance]
        @distance = params[:distance].to_f
      end
      @communities = Community.near_location(current_user.userprofile.latitude, current_user.userprofile.longitude, @distance)
      @title = "All Communities within " + @distance.to_s + " miles of you."
    
      
    elsif signed_in_cbo?
      @distance = 50
      if params[:distance]
        @distance = params[:distance].to_f
      end
      @communities = Community.near_location(current_cbo.cboprofile.latitude, current_cbo.cboprofile.longitude, @distance)
      @title = "All Communities within " + @distance.to_s + " miles of you."
    else
      #You are not signed in
      authenticate_user
    end
    
    
  end
  

end
