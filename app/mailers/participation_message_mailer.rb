class ParticipationMessageMailer < ActionMailer::Base
  default :from => "do-not-reply@thecollegeproject.org"
  
  
  def new_message_from_cbo(participation_message)
    @cbo = participation_message.cbo
    @user = participation_message.user
    @participation_message = participation_message
    @url = "http://#{request.host_with_port}" + participation_path(participation_message.participation) #request.url #request.host_with_port + participation_path(participation_message.participation)
    
    mail(:to => @user.email, :subject => "New message from #{@cbo.cboprofile.name}!")
  end
  
  
  def new_message_from_user(participation_message)
    @cbo = participation_message.cbo
    @user = participation_message.user
    @participation_message = participation_message
    @url = "http://#{request.host_with_port}" + participation_path(participation_message.participation) #request.url #request.host_with_port + participation_path(participation_message.participation)
    
  
    mail(:to => @cbo.email, :subject => "New message from #{@user.userprofile.name}!")
  end
  
  
  # the three methods below could probably be shifted to their own ParticipationMailer class...
  
  def status_changed(participation)
    @cbo = participation.cbo
    @user = participation.user
    @participation = participation
    @url = "http://#{request.host_with_port}" + participation_path(participation)
    
    mail(:to => @user.email, :subject => "Your application to #{@cbo.cboprofile.name} has been updated!")
  end
  
  def schedule_changed(participation)
    @cbo = participation.cbo
    @user = participation.user
    @participation = participation
    @url = "http://#{request.host_with_port}" + participation_path(participation)
    
    mail(:to => @cbo.email, :subject => "#{@user.userprofile.name} has updated their application schedule!")
  end
  
  def new_participation(participation)
    @cbo = participation.cbo
    @user = participation.user
    @participation = participation
    @url = "http://#{request.host_with_port}" + participation_path(participation)
    
    mail(:to => @cbo.email, :subject => "#{@user.userprofile.name} has sent you a new application!")
  end
  
end
