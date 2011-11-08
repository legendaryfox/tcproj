
# == Schema Information
#
# Table name: participations
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  cbo_id     :integer
#  created_at :datetime
#  updated_at :datetime
#




class Participation < ActiveRecord::Base
  belongs_to :user,  :class_name => "User"
  belongs_to :cbo,      :class_name => "Cbo"
end

