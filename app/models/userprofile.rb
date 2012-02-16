


class Userprofile < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :nickname, :school, :avatar
  attr_accessible :street1, :street2, :city, :state, :zip, :country
  attr_accessible :short_bio, :long_bio, :core_question1_response, :core_question2_response, :core_question3_response, :core_question4_response
  attr_accessible :latitude, :longitude
  
  geocoded_by :full_address #TODO - split address up into street, state, etc, then glue back into an "address" method instead.
  after_validation :geocode, :if => (:street1_changed? || :street2_changed? || :city_changed? || :state_changed? || :zip_changed? || :country_changed?)
  
  
  belongs_to :user
  
  has_attached_file :avatar, 
    :styles => { :medium => "200x250>", :thumb => "100x125>" },
    :default_url => "200x250.gif",
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => "/:style/:id/:filename",
    :s3_storage_class => :reduced_redundancy
    
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => [ /^image\/(?:jpeg|gif|png)$/, nil ]
  
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :school, :presence => true

  
  validates :short_bio, :length => { :maximum => 140 }
  validates :long_bio, :length => { :maximum => 1000 }
  
  validates :core_question1_response, :length => { :maximum => 1000 }
  validates :core_question2_response, :length => { :maximum => 1000 }
  validates :core_question3_response, :length => { :maximum => 1000 }
  validates :core_question4_response, :length => { :maximum => 1000 }
  
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
#  id                      :integer         not null, primary key
#  created_at              :datetime
#  updated_at              :datetime
#  firstname               :string(255)
#  lastname                :string(255)
#  nickname                :string(255)
#  user_id                 :integer
#  street1                 :string(255)     default("")
#  street2                 :string(255)     default("")
#  city                    :string(255)     default("")
#  state                   :string(255)     default("")
#  zip                     :string(255)     default("")
#  country                 :string(255)     default("")
#  latitude                :float
#  longitude               :float
#  short_bio               :text
#  long_bio                :text
#  core_question1_response :text
#  core_question2_response :text
#  core_question3_response :text
#  core_question4_response :text
#  school                  :string(255)
#  avatar_file_name        :string(255)
#  avatar_content_type     :string(255)
#  avatar_file_size        :integer
#  avatar_updated_at       :datetime
#

