class ParticipationMessagesController < ApplicationController
  
  def index
    @participation_messages = ParticipationMessage.all
  end
  
  
  def create
    @participation_message = ParticipationMessage.new(params[:participation_message])
    if @participation_message.save
      #successfully saved
      redirect_to @participation_message.participation, :flash => { :sucess => "Your message has been sent." }
    else
      redirect_to @participation_message.participation, :flash => { :error => "There was an error with your request." }
    end
    
  end
  
end
