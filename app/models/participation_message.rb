class ParticipationMessage < ActiveRecord::Base
  attr_accessible :message, :participation_id, :created_at, :user_id, :cbo_id, :user_or_cbo
  attr_accessible :user_or_cbo # 1 = message originates from user, 2 = from cbo
  
  belongs_to :participation
  belongs_to :user
  belongs_to :cbo


  validate :message, :presence => true, :length => { :maximum => 255 }
  validate :user_or_cbo, :presence => true
  
  default_scope :order => 'participation_messages.created_at ASC'
  
  # TODO: probably need to put in some anti-spamming measures.


  def sender_profile_object
    if self.user_or_cbo == 1
      # user sent.
      return self.user.userprofile
      
    elsif self.user_or_cbo == 2
      # cbo sent.
      return self.cbo.cboprofile
      
    end
  end

  def sender_name
    return self.sender_profile_object.name
  end
  
end




# == Schema Information
#
# Table name: participation_messages
#
#  id               :integer         not null, primary key
#  message          :text
#  participation_id :integer         not null
#  user_or_cbo      :integer
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer
#  cbo_id           :integer
#

