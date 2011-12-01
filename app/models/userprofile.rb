


class Userprofile < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :nickname
  attr_accessible :street1, :street2, :city, :state, :zip, :country
  
  geocoded_by :full_address #TODO - split address up into street, state, etc, then glue back into an "address" method instead.
  after_validation :geocode, :if => (:street1_changed? || :street2_changed? || :city_changed? || :state_changed? || :zip_changed? || :country_changed?)
  
  
  belongs_to :user
  
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  
  def name_full(include_nickname = true)
    firstname + (nickname_with_quotes && include_nickname ? " " + nickname_with_quotes : "" ) + " " + lastname
  end
  
  
  
  def name
    nickname.blank? ? firstname : nickname
  end


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
    
  private
  
    def nickname_with_quotes
      nickname.blank? ? nil : '"' + nickname + '"'
    end
  
  
  
end



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
#  user_id    :integer
#  street1    :string(255)     default("")
#  street2    :string(255)     default("")
#  city       :string(255)     default("")
#  state      :string(255)     default("")
#  zip        :string(255)     default("")
#  country    :string(255)     default("")
#  latitude   :float
#  longitude  :float
#

