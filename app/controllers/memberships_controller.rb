class MembershipsController < ApplicationController
  
  def new

  end
  
  def create
    #@cbo = Cbo.find(params[:participations][:cbo_id])
    #redirect_to @cbo
    #puts params
    
    #first need to check if such a membership already exists (pending or not)
    @cbo = Cbo.find_by_id(params[:membership][:cbo_id])
    
    
    if(Membership.all(:conditions => "cbo_id = " + params[:membership][:cbo_id].to_s + " AND user_id = " + current_user.id.to_s).count == 0)
      
      
      current_user.join_cbo!(@cbo)
      redirect_to @cbo.cboprofile, :flash => { :success => "You have applied to this CBO." }
    else
      redirect_to @cbo.cboprofile, :flash => { :error => "There was an error in processing your request." }
    end
    
  end
=begin
  def destroy
    @cbo = Membership.find_by_id(params[:id]).cbo
    current_user.leave_cbo!(@cbo)
    redirect_to @cbo, :flash => { :success => "You have successfully left this CBO." }
    
  end
=end  
  
  def destroy
    membership = Membership.find_by_id(params[:id])
    user = membership.user
    cbo = membership.cbo
    user.leave_cbo!(cbo)
    if signed_in_user?
      redirect_to cbo.cboprofile, :flash => { :success => "You have successfully left this CBO." }
    else
      redirect_to cbo, :flash => { :success => "You have successfully removed " + user.userprofile.name + "." }
    end
  end
  
  def confirm
    @title = "hello"
    membership = Membership.find_by_id(params[:id])
    membership.confirm!
    user = User.find_by_id(params[:membership][:user_id])
    redirect_to Cbo.find_by_id(params[:membership][:cbo_id]), :flash => { :success => "You have approved " + user.userprofile.name + "!" }
  end
  

end
