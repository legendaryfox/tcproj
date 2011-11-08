
# == Schema Information
#
# Table name: categories
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Category < ActiveRecord::Base
  attr_accessible :name, :description
  
  validates :name,  :presence => true,
                    :length => { :maximum => 32}
                    
  validates :description, :presence => true,
                          :length => { :maximum => 140 }
end

