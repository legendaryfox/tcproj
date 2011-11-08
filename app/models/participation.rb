
# == Schema Information
#
# Table name: participations
#
#  id         :integer         not null, primary key
#  student_id :integer
#  cbo_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Participation < ActiveRecord::Base
  belongs_to :student,  :class_name => "User"
  belongs_to :cbo,      :class_name => "Cbo"
end

