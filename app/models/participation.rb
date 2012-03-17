class Participation < ActiveRecord::Base
  
  
  # attr_accessible :status
  serialize :monday
  serialize :tuesday
  serialize :wednesday
  serialize :thursday
  serialize :friday
  serialize :saturday
  serialize :sunday
  
  attr_accessible :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday
  attr_accessible :cbo_id
  attr_accessible :status
  
 
 
  belongs_to :user, :class_name => "User"
  belongs_to :cbo, :class_name => "Cbo"
  
  validates :user_id, :presence => true
  validates :cbo_id, :presence => true
  
  validates_uniqueness_of :cbo_id, :scope => :user_id
  
  
  # custom validation for user/cbo uniqueness
  #validate :validate_user_cbo_uniqueness
  
  
  #after_initialize :set_default_schedule
  
  def set_status(status_level)
    # status level 0 - unconfirmed
    # status level 1 - more info
    # status level 2 - confirmed
    
    
    if status_level.to_i <= 2 && status_level.to_i >= 0
      self.status = status_level.to_i
    end
    
  end
  
=begin  
  def validate_user_cbo_uniqueness
    
    if user = User.find(user_id)
      errors.add(:cbo_id, "already has a participation with #{user.userprofile}") if user.participations.find_by_cbo_id(cbo_id)
    end
  end
=end  
  def set_default_schedule
    
    day_schedule = {
      :hour0 => 0,
      :hour1 => 0,
      :hour2 => 0,
      :hour3 => 0,
      :hour4 => 0,
      :hour5 => 0,
      :hour6 => 0,
      :hour7 => 0,
      :hour8 => 0,
      :hour9 => 0,
      :hour10 => 0,
      :hour11 => 0,
      :hour12 => 0,
      :hour13 => 0,
      :hour14 => 0,
      :hour15 => 0,
      :hour16 => 0,
      :hour17 => 0,
      :hour18 => 0,
      :hour19 => 0,
      :hour20 => 0,
      :hour21 => 0,
      :hour22 => 0,
      :hour23 => 0
      
    }
    
    #self.cbo_id = 9000
    self.monday = day_schedule
    self.tuesday = day_schedule
    self.wednesday = day_schedule
    self.thursday = day_schedule
    self.friday = day_schedule
    self.saturday = day_schedule
    self.sunday = day_schedule
  end
  
  
end


# == Schema Information
#
# Table name: participations
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  cbo_id     :integer
#  status     :integer         default(0)
#  monday     :text
#  tuesday    :text
#  wednesday  :text
#  thursday   :text
#  friday     :text
#  saturday   :text
#  sunday     :text
#  created_at :datetime
#  updated_at :datetime
#

