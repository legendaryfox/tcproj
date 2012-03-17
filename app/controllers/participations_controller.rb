class ParticipationsController < ApplicationController
  
  before_filter :authenticate_user, :only => [:new, :create, :edit]
  
  def new
    @participation = Participation.new
    @participation.set_default_schedule # there's probably a better way to do this...
  end
  
  def create
    @participation = current_user.participations.new()
    @participation.set_default_schedule # there's probably a better way to do this...
    
    @participation.attributes = params[:participation]
    if @participation.save
      redirect_to @participation, :success => "Successfully made your participation"
    else
      render 'new'
    end
  end
  
  def index
    @participations = Participation.all
  end
  
  def show
    @participation = Participation.find(params[:id])
  end
  
  def edit
    @participation = Participation.find(params[:id])
  end
  
  def update
    @participation = Participation.find(params[:id])
    #params[:participation][:status].to_i
    if @participation.update_attributes(params[:participation])
      redirect_to @participation, :success => "Successfully updated your participation"
    else
      render 'edit'
    end
  end
  
  def change_status
    @participation = Participation.find(params[:id])
  end
  
  
  
end
