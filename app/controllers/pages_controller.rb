class PagesController < ApplicationController
  def home
    redirect_to map_path
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
    #How about now?
  end
  
  def map
    
    
    @selected_category = params[:category_id]
    @categories = Category.all
    
    @title = "The College Project"
    all_cbos = Cbo.all
    unsubscribed_cbos = all_cbos
    subscribed_cbos = []
    
    @unsubscribed_cboprofiles = []
    @subscribed_cboprofiles = []
    
    @center_lat = 42.357778
		@center_lng = -71.061667
		@center_text = "Boston"
	
    if signed_in_user?
  		@center_lat ||= current_user.userprofile.latitude
  		@center_lng ||= current_user.userprofile.longitude
  		@center_text = "#{current_user.userprofile.name}, Your Current Location"
  		
  		
      subscribed_cbos = current_user.subscribed_cbos
  		unsubscribed_cbos = all_cbos - subscribed_cbos
  	end
  	
	
	  
	  
	  # Filter based on category
	  if !@selected_category.blank?
      # A category is provided
      unsubscribed_cbos.each do |unsubscribed_cbo|
        if unsubscribed_cbo.cboprofile.category_id == @selected_category.to_i
          @unsubscribed_cboprofiles.push(unsubscribed_cbo.cboprofile)
                
        end
      end
      
      subscribed_cbos.each do |subscribed_cbo|
        if subscribed_cbo.cboprofile.category_id == @selected_category.to_i
          @subscribed_cboprofiles.push(subscribed_cbo.cboprofile)
            
        end
      end
     
      @category_name = Category.find_by_id(@selected_category.to_i).name
      
    else
      # No category provided - no filtering

      @unsubscribed_cboprofiles = unsubscribed_cbos.collect {|unsubscribed_cbo| unsubscribed_cbo.cboprofile }
  	  @subscribed_cboprofiles = subscribed_cbos.collect {|subscribed_cbo| subscribed_cbo.cboprofile }

 	  
  	  @category_name = 'All Categories'
  	  
    end
	  
	  # End filter
	  
	  @cbo_count = @unsubscribed_cboprofiles.count + @subscribed_cboprofiles.count
	 
    
    
    
  end

end
