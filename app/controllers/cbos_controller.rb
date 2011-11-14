class CbosController < ApplicationController
  rescue_from ActiveRecord::RecordNotUnique, :with => :record_not_unique 
  
  def new
    @cbo = Cbo.new
  end
  
  def show
    @cbo = Cbo.find(params[:id])
  end
  
  def index
    @cbos = Cbo.all
    @title = "All CBOs"
  end
  
  def create
    @cbo = Cbo.new(params[:cbo])
    if @cbo.save
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

end
