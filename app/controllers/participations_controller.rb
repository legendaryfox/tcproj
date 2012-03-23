class ParticipationsController < ApplicationController
  
  before_filter :authenticate_user, :only => [:new, :create, :edit, :my]
  
  def new
    @participation = Participation.new
    @participation.set_default_schedule # there's probably a better way to do this...
  end
  
  def my
    @participations = current_user.participations
  end
  
  def create
    @participation = current_user.participations.new()
    @participation.set_default_schedule # there's probably a better way to do this...
    
    @participation.attributes = params[:participation]
    if @participation.save
      #redirect_to @participation, :success => "Successfully made your participation"
      redirect_to @participation.cbo.cboprofile, :flash => {:success => "Successfully sent your application! Please wait further instructions."}
    else
      render 'new'
    end
  end
  
  def index
    @participations = Participation.all
  end
  
  def show
    @participation = Participation.find(params[:id])
    #@new_participation_message = ParticipationMessage.new
  end
  
  def edit
    @participation = Participation.find(params[:id])
  end
  
  def update
    @participation = Participation.find(params[:id])
    #params[:participation][:status].to_i
    if @participation.update_attributes(params[:participation])
      
      if signed_in_cbo?
        redirect_to @participation.cbo, :flash => {:success => "Successfully changed confirmation level."}
        
        # log via a ParticipationMessage
        ParticipationMessage.create(:participation_id => @participation.id,
                                    :user_id => @participation.user_id,
                                    :cbo_id => @participation.cbo_id,
                                    :user_or_cbo => 2,
                                    :message => "#{current_cbo.cboprofile.name} updated status.")
      else
        redirect_to @participation.cbo.cboprofile, :flash => {:success => "Successfully updated your participation"}
        
        ParticipationMessage.create(:participation_id => @participation.id,
                                    :user_id => @participation.user_id,
                                    :cbo_id => @participation.cbo_id,
                                    :user_or_cbo => 1,
                                    :message => "#{current_user.userprofile.name} updated schedule.")
      end
    else
      render 'edit'
    end
  end
  
  def change_status
    @participation = Participation.find(params[:id])
  end
  
  
  
end
