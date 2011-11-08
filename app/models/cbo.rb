
# == Schema Information
#
# Table name: cbos
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#


class Cbo < ActiveRecord::Base
  attr_accessible :name, :email
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name,  :presence => true,
                    :length => { :maximum => 32 }
                    
  validates :email, :presence => true,
                    :format => { :with => email_regex }
                    
  
  
end

