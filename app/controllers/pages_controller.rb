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
  
  def landing
    @title = "The College Project"
    @cboprofiles = Cboprofile.all
  end

end
