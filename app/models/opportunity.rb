


class Opportunity < ActiveRecord::Base
  attr_accessible :name, :description, :cbo_id, :questionnaire_id
  attr_accessible :address, :latitude, :longitude
  
  geocoded_by :address
  
  belongs_to :cbo
  
  has_many :participations
  
  has_many :users, :through => :participations, :source => :user
  
  validates :cbo_id, :presence => true
  
  
  def confirmed_users_participations(confirm_level = 1)
    self.participations.find_all_by_confirmed(confirm_level)
  end
  
  def confirmed_users(confirm_level = 1)
    
    #first, get the participations
    #all_participations = self.participations.find_all_by_confirmed(confirm_level)
    users_list = Array.new
    self.confirmed_users_participations(confirm_level).each do |participation|
      users_list.push(participation.user_id)
    end
    return User.find_all_by_id(users_list)
  end
  
  def pending_users_participations
    self.confirmed_users_participations(0)
  end
  
  def pending_users
    self.confirmed_users(0)
  end
  
  
  def confirm_user!(user)
    # check the user to make sure user is part of CBO's pending
    if user.pending_of_opportunity?(self)
      self.participations.find_by_user_id(user).confirm!
    end
  end
  
end

# == Schema Information
#
# Table name: opportunities
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  description      :string(255)
#  cbo_id           :integer
#  questionnaire_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#  start_date       :datetime
#  end_date         :datetime
#  address          :string(255)
#  latitude         :float
#  longitude        :float
#  information      :text
#

