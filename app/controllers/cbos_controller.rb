class CbosController < ApplicationController
  rescue_from ActiveRecord::RecordNotUnique, :with => :record_not_unique 
  
  before_filter :authenticate_cbo, :only => [:edit, :update]
  before_filter :correct_cbo, :only => [:edit, :update]
  before_filter :check_confirmed_cbo, :only => [:show]
  
  
  def new
    @title = "New CBO"
    @cbo = Cbo.new
    @cbo.build_cboprofile
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
  
  def confirmpage
    @title = "Confirm CBO"
    @cbo = Cbo.new
  end
  
  def confirm
    @title = "Confirm"
    
    #first, check their passwords
    cbo = Cbo.authenticate(params[:cbo][:email], params[:cbo][:password])
    if cbo.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Confirm CBO"
      @user = Cbo.new
      render 'confirmpage'
    else
      # ok, they're a real user. Confirm them.
      
      #have to re-add their password...
      cbo.password = params[:cbo][:password]
      
      if cbo.confirm!
        redirect_to signin_path, :notice => "CBO confirmed. Please sign in."
      end
    end
    
  end
  
  
  def index
    @cbos = Cbo.find_all_by_confirmed(1)
    @title = "All CBOs"
  end
  
  
  
  def create
    @cbo = Cbo.new(params[:cbo])
    if @cbo.save
      #sign_in_cbo @cbo
      #redirect_to @cbo
      redirect_to confirmpage_cbos_path, :notice => "CBO created. Please confirm your account here."
      
    else
      @title = "New CBO"
      @cbo.build_cboprofile(params[:cbo][:cboprofile_attributes])
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
    
    def check_confirmed_cbo
      # checks if the TARGET cbo is confirmed.
      @cbo = Cbo.find(params[:id])
      redirect_to(cbos_path) unless @cbo.confirmed?
    end

end
