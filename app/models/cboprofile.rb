class Cboprofile < ActiveRecord::Base
  attr_accessible :name, :description, :address, :latitude, :longitude
  geocoded_by :address #TODO - split address up into street, state, etc, then glue back into an "address" method instead.
  after_validation :geocode, :if => :address_changed?
  
  belongs_to :cbo
  
  validates :name, :presence => true
  
  
end

# == Schema Information
#
# Table name: cboprofiles
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  address     :string(255)
#  latitude    :float
#  longitude   :float
#  cbo_id      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

