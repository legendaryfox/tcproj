class ParticipationsController < ApplicationController
  def new

  end
  
  def create
    #@cbo = Cbo.find(params[:participations][:cbo_id])
    #redirect_to @cbo
    #puts params
    @cbo = Cbo.find_by_id(params[:participation][:cbo_id])
    current_user.join_cbo!(@cbo)
    redirect_to @cbo, :flash => { :success => "You have successfully joined this CBO." }
    
  end
  
  def destroy
    @cbo = Participation.find_by_id(params[:id]).cbo
    current_user.leave_cbo!(@cbo)
    redirect_to @cbo, :flash => { :succes => "You have successfully left this CBO." }
    
  end
  
end
