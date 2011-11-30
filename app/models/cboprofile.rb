class Cboprofile < ActiveRecord::Base
  attr_accessible :name, :description, :latitude, :longitude
  attr_accessible :street1, :street2, :city, :state, :zip, :country
  
  geocoded_by :full_address #TODO - split address up into street, state, etc, then glue back into an "address" method instead.
  after_validation :geocode, :if => (:street1_changed? || :street2_changed? || :city_changed? || :state_changed? || :zip_changed? || :country_changed?)
  
  belongs_to :cbo
  
  validates :name, :presence => true
  
  
  def full_address
    running_address = ""
    if !self.street1.empty?
      running_address += self.street1 + ', '
    end
    
    if !self.street2.empty?
      running_address += self.street2 + ', '
    end
    
    if !self.city.empty?
      running_address += self.city + ', '
    end
    
    if !self.state.empty?
      running_address += self.state + ', '
    end
    
    if !self.zip.empty?
      running_address += self.zip + ', '
    end
    
    if !self.country.empty?
      running_address += self.country
    end
    
    return running_address
    
  end
  
  def self.near_location(lat, long, distance, confirmed_level=1)
    return Cboprofile.near([lat, long], distance).all.delete_if{ |cboprofile| !cboprofile.cbo.confirmed? }
  end
  
  
end


# == Schema Information
#
# Table name: cboprofiles
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  latitude    :float
#  longitude   :float
#  cbo_id      :integer
#  created_at  :datetime
#  updated_at  :datetime
#  street1     :string(255)
#  street2     :string(255)
#  city        :string(255)
#  state       :string(255)
#  zip         :string(255)
#  country     :string(255)
#

