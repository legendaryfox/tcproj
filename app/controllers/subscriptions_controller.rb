class SubscriptionsController < ApplicationController
  
  
  before_filter :authenticate_user
  
  def create
    
    
    @cbo = Cbo.find_by_id(params[:subscription][:cbo_id])
    
    
    if(Subscription.all(:conditions => "cbo_id = " + params[:subscription][:cbo_id].to_s + " AND user_id = " + current_user.id.to_s).count == 0)
      current_user.subscribe_to(@cbo)
      redirect_to @cbo.cboprofile, :flash => { :success => "You have subscribed to this CBO." }
      
    else
      redirect_to @cbo.cboprofile, :flash => { :error => "There was an error in processing your request." }
      
    end
    
  end
  
  def destroy
    subscription = Subscription.find_by_id(params[:id])
    user = subscription.user
    cbo = subscription.cbo
    
    if user.unsubscribe_from(cbo)
      redirect_to cbo.cboprofile, :flash => { :success => "You have successfully unsubscribed from this CBO." }
      
    else
      redirect_to cbo, :flash => { :error => "There was an error processing your request." }
      
    end
  end

end
