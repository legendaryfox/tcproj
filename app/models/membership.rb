class Membership < ActiveRecord::Base
=begin
  attr_accessible :confirmed, :cbo_id, :user_id
  # 0 = not confirmed - admin needs to read
  # 1 = admin confirmed - CBO needs to read
  # 2 = cbo read - pending - on hold for now
  # 3 = cbo read - denied
  # 4 = cbo read - accepted
  
  
  belongs_to :user,  :class_name => "User"
  belongs_to :cbo,      :class_name => "Cbo"
  has_one :qresponse
  
  def confirm!(level=4)
    #self.toggle!(:confirmed)
    self.confirmed = level
    self.save
  end
  

  def confirmed?
    self.confirmed != 0
  end
=end
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

