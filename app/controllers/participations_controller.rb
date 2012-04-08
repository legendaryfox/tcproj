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

      # update view participation messages
      @participation.user.post_participation_message(@participation, "#{current_user.userprofile.name} created participation.")
      redirect_to @participation.cbo.cboprofile, :flash => {:success => "Successfully sent your application! Please wait further instructions."}
    
      # send an email out
      ParticipationMessageMailer.deliver_new_participation(@participation)
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
        # log via a ParticipationMessage                   
        @participation.cbo.post_participation_message(@participation, "#{current_cbo.cboprofile.name} updated status to #{@participation.status_string.titlecase}.")
        redirect_to @participation.cbo, :flash => {:success => "Successfully changed confirmation level."}
        
        # Send mail using mailer
        ParticipationMessageMailer.deliver_status_changed(@participation)
        
      else
        # user
        # log via a ParticipationMessage
        @participation.user.post_participation_message(@participation, "#{current_user.userprofile.name} updated schedule.")
        redirect_to @participation.cbo.cboprofile, :flash => {:success => "Successfully updated your participation"}
        
        # Send mail using mailer
        ParticipationMessageMailer.deliver_schedule_changed(@participation)
    
      end
    else
      render 'edit'
    end
  end
  
  def change_status
    @participation = Participation.find(params[:id])
  end
  
  
  
end
