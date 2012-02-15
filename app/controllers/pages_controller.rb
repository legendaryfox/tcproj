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
    unjoined_cbos = all_cbos
    joined_cbos = []
    
    @unjoined_cboprofiles = []
    @joined_cboprofiles = []
    
    @centerLat = 42.357778
		@centerLng = -71.061667
		@centerText = "Boston"
	
    if signed_in_user?
  		@centerLat ||= current_user.userprofile.latitude
  		@centerLng ||= current_user.userprofile.longitude
  		@centerText = "#{current_user.userprofile.name}, Your Current Location"
  		
  		
      joined_cbos = current_user.cbos
  		unjoined_cbos = all_cbos - joined_cbos
  	end
  	
	
	  
	  
	  # Filter based on category
	  if !@selected_category.blank?
      # A category is provided
      unjoined_cbos.each do |unjoined_cbo|
        if unjoined_cbo.cboprofile.category_id == @selected_category.to_i
          @unjoined_cboprofiles.push(unjoined_cbo.cboprofile)
        end
      end
      
      joined_cbos.each do |joined_cbo|
        if joined_cbo.cboprofile.category_id == @selected_category.to_i
          @joined_cboprofiles.push(joined_cbo.cboprofile)
        end
      end
     
      @category_name = Category.find_by_id(@selected_category.to_i).name
      
      
      #@unjoined_cboprofiles = unjoined_cbos.collect {|unjoined_cbo| if (unjoined_cbo.cboprofile.category_id == @selected_category) unjoined_cbo.cboprofile end }
  	  #@joined_cboprofiles = joined_cbos.collect {|joined_cbo| joined_cbo.cboprofile }
    else
      # No category provided - no filtering
      @unjoined_cboprofiles = unjoined_cbos.collect {|unjoined_cbo| unjoined_cbo.cboprofile }
  	  @joined_cboprofiles = joined_cbos.collect {|joined_cbo| joined_cbo.cboprofile }
  	  
  	  @category_name = 'All Categories'
  	  
    end
	  
	  # End filter
	  
	  @cbo_count = @unjoined_cboprofiles.count + @joined_cboprofiles.count
	 
    
    
    
  end

end
