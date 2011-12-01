class UserCommunityMembership < ActiveRecord::Base
  belongs_to :user, :class_name => "User"
  belongs_to :community, :class_name => "Community"
  
end

# == Schema Information
#
# Table name: user_community_memberships
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  community_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

