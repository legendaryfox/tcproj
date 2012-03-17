class ParticipationsController < ApplicationController
  
  before_filter :authenticate_user, :only => [:new, :create, :edit, :update]
  
  def new
    @participation = Participation.new
    @participation.set_default_schedule
  end
  
  def create
    @participation = current_user.participations.new()
    @participation.set_default_schedule
    @participation.attributes = params[:participation]
    if @participation.save
      redirect_to participations_path, :success => "Successfully made your participation"
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
    if @participation.update_attributes(params[:participation])
      redirect_to participations_path, :success => "Successfully updated your participation"
    else
      render 'edit'
    end
  end
  
  
  
end
