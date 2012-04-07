class ParticipationMessagesController < ApplicationController
  
  #before_filter :authenticate_user, :only => [:create]
  
  def index
    @participation_messages = ParticipationMessage.all
  end
  
  
  def create
    @participation_message = ParticipationMessage.new(params[:participation_message])
    if @participation_message.save
      #successfully saved
      redirect_to @participation_message.participation, :flash => { :sucess => "Your message has been sent." }
      
      if @participation_message.user_or_cbo == 1
        # originates from user
        ParticipationMessageMailer.deliver_new_message_from_user(@participation_message)
        
      elsif @participation_message.user_or_cbo == 2
        # originates from cbo 
        ParticipationMessageMailer.deliver_new_message_from_cbo(@participation_message)
      end
      
    else
      redirect_to @participation_message.participation, :flash => { :error => "There was an error with your request." }
    end
    
  end
  
end
