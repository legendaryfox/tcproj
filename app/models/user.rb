
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  student    :boolean         default(TRUE)
#  admin      :boolean         default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => true

  has_many :participations, :foreign_key => "student_id"               
    
  has_many :cbos, :through => :participations, :source => :cbo
  
  
end
