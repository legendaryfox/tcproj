

# == Schema Information
#
# Table name: userprofiles
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  firstname  :string(255)
#  lastname   :string(255)
#  nickname   :string(255)
#


class Userprofile < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :nickname
  
  belongs_to :user
  
  validates :firstname, :presence => true
  validates :lastname, :presence => true
end
