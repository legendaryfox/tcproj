class ParticipationMessageMailer < ActionMailer::Base
  default :from => "do-not-reply@thecollegeproject.org"
  
  
  def new_message_from_cbo(participation_message)
    @cbo = participation_message.cbo
    @user = participation_message.user
    @participation_message = participation_message
    mail(:to => @user.email, :subject => "New message from #{@cbo.cboprofile.name}!")
  end
  
  
  def new_message_from_user(participation_message)
    @cbo = participation_message.cbo
    @user = participation_message.user
    @participation_message = participation_message
    mail(:to => @cbo.email, :subject => "New message from #{@user.userprofile.name}!")
  end
  
  def status_changed(participation)
    @cbo = participation.cbo
    @user = participation.user
    @participation = participation
    mail(:to => @user.email, :subject => "Your application to #{@cbo.cboprofile.name} has been updated!")
  end
  
end
