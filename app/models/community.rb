class Community < ActiveRecord::Base
  attr_accessible :name, :city, :state, :latitude, :longitude, :zip, :community_avatar
  
  geocoded_by :full_address
  
  after_validation :geocode
  
  
  has_many :user_community_memberships
  has_many :users, :through => :user_community_memberships, :source => :user
  
  has_many :cbo_community_memberships
  has_many :cbos, :through => :cbo_community_memberships, :source => :cbo
  
  has_attached_file :community_avatar, 
    :styles => { :medium => "200x250>", :thumb => "100x125>" },
    :default_url => "200x250.gif",
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => "/:style/:id/:filename",
    :s3_storage_class => :reduced_redundancy
    
  validates_attachment_size :community_avatar, :less_than => 5.megabytes
  validates_attachment_content_type :community_avatar, :content_type => [ /^image\/(?:jpeg|gif|png)$/, nil ]
  
  
  
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
   
   def self.near_location(lat, long, distance, confirmed_level=1)
     return Community.near([lat, long], distance).all #.delete_if{ |community| !cboprofile.cbo.confirmed? }
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
#  id                            :integer         not null, primary key
#  name                          :string(255)
#  city                          :string(255)
#  state                         :string(255)
#  latitude                      :float
#  longitude                     :float
#  created_at                    :datetime
#  updated_at                    :datetime
#  zip                           :string(255)
#  community_avatar_file_name    :string(255)
#  community_avatar_content_type :string(255)
#  community_avatar_file_size    :integer
#  community_avatar_updated_at   :datetime
#

