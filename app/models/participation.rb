



class Participation < ActiveRecord::Base
=begin
  belongs_to :user,  :class_name => "User"
  belongs_to :opportunity,      :class_name => "Opportunity"
  
  def confirm!(level=1)
    self.toggle!(:confirmed)
  end

  def confirmed?
    self.confirmed != 0
  end
=end
end


# == Schema Information
#
# Table name: participations
#
#  id             :integer         not null, primary key
#  user_id        :integer
#  opportunity_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  confirmed      :integer         default(0)
#

