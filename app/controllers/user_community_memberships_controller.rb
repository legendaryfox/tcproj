class UserCommunityMembershipsController < ApplicationController
  
  
  def create
    
    @community = Community.find_by_id(params[:user_community_membership][:community_id])
    if current_user.join_community!(@community)
      redirect_to @community, :flash => { :success => "You have successfuly joined this CBO." }
    else
      redirect_to @community, :flash => { :error => "There was an error in processing your request." }
    end
  end
    
  def destroy
    
    @community = UserCommunityMembership.find_by_id(params[:id]).community
    if current_user.leave_community!(@community)
      redirect_to @community, :flash => { :success => "You have successfully left this Community." }
    else
      reidrect_to @community, :flash => { :error => "There was an error in processing your request." }
    end
  end
  

end
