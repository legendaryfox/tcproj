class Membership < ActiveRecord::Base
  belongs_to :user,  :class_name => "User"
  belongs_to :cbo,      :class_name => "Cbo"
  
  def confirm!(level=1)
    self.toggle!(:confirmed)
  end

  def confirmed?
    self.confirmed != 0
  end
  
end



# == Schema Information
#
# Table name: memberships
#
#  id                 :integer         not null, primary key
#  user_id            :integer
#  cbo_id             :integer
#  created_at         :datetime
#  updated_at         :datetime
#  confirmed          :integer         default(0)
#  question1_text     :text
#  question1_response :text
#

