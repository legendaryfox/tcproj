class Community < ActiveRecord::Base
  attr_accessible :name, :city, :state, :latitude, :longitude, :zip
  
  geocoded_by :full_address
  
  after_validation :geocode
  
  
  has_many :user_community_memberships
  has_many :users, :through => :user_community_memberships, :source => :user
  
  has_many :cbo_community_memberships
  has_many :cbos, :through => :cbo_community_memberships, :source => :cbo
  
  
  
  def full_address
     running_address = ""
     
     if !self.city.empty?
       running_address += self.city + ', '
     end

     if !self.state.empty?
       running_address += self.state + ', '
     end
     
     if !self.zip.empty?
        running_address += self.zip
      end

     return running_address

   end
   
   private
   
    def auto_add_objects
      #some things to auto-scour and add objects to the community, based on location
      
    end
  
  
end


# == Schema Information
#
# Table name: communities
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  city       :string(255)
#  state      :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime
#  updated_at :datetime
#  zip        :string(255)
#

