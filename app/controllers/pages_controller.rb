class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
    #How about now?
  end
  
  def map
    @title = "The College Project"
    all_cbos = Cbo.all
    unjoined_cbos = all_cbos
    joined_cbos = nil
    
    
    if signed_in_user?
  		@centerLat = current_user.userprofile.latitude
  		@centerLng = current_user.userprofile.longitude
  		@centerText = "#{current_user.userprofile.name}, Your Current Location"
  		@centerLat ||= 42.357778
  		@centerLng ||= -71.061667
  		@centerText ||= "Boston"
  		
      joined_cbos = current_user.cbos
  		unjoined_cbos = all_cbos - joined_cbos
  	end
  	
  	@unjoined_cboprofiles = unjoined_cbos.collect {|unjoined_cbo| unjoined_cbo.cboprofile }
  	@joined_cboprofiles = joined_cbos.collect {|joined_cbo| joined_cbo.cboprofile }
    
    
    
    
  end

end
