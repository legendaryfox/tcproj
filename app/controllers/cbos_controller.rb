class CbosController < ApplicationController
  rescue_from ActiveRecord::RecordNotUnique, :with => :record_not_unique 
  
  before_filter :authenticate_cbo, :only => [:edit, :update]
  before_filter :correct_cbo, :only => [:edit, :update]
  
  
  def new
    @cbo = Cbo.new
  end
  
  def show
    @cbo = Cbo.find(params[:id])
  end
  
  def edit
    @title = "Edit CBO"
  end
  
  def update
    if @cbo.update_attributes(params[:cbo])
      redirect_to @cbo, :flash => { :success => "CBO updated." }
    else
      @title = "Edit CBO"
      render 'edit'
    end
  end
  
  
  def index
    @cbos = Cbo.find_all_by_confirmed(1)
    @title = "All CBOs"
  end
  
  def create
    @cbo = Cbo.new(params[:cbo])
    if @cbo.save
      sign_in_cbo @cbo
      redirect_to @cbo
    else
      render 'new'
    end
  end
  
  private
    def record_not_unique
      @cbo.errors.add(:email, "is already taken")
      render 'new'
    end
    
    def correct_cbo
      @cbo = Cbo.find(params[:id])
      redirect_to(root_path) unless current_cbo?(@cbo)
    end

end
