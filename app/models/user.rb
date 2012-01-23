
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation, :student
  attr_accessible :userprofile_attributes
  
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
                    
  validates :password,  :presence => true,
                        :confirmation => true,
                        :length => { :within => 6..40 }
                        
  before_save :encrypt_password

  has_many :memberships #, :foreign_key => "user_id"               
  has_many :cbos, :through => :memberships, :source => :cbo
  
  #has_many :participations
  #has_many :opportunities, :through => :participations, :source => :opportunity
  
  has_many :user_community_memberships
  has_many :communities, :through => :user_community_memberships, :source => :community
  
  has_one :userprofile
  has_many :qresponses
  
  accepts_nested_attributes_for :userprofile
  
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def join_cbo!(cbo, default_confirm = 0)
    self.memberships.create!(:cbo_id => cbo.id, :confirmed => default_confirm)
  end
  
  def join_community!(community)
    self.user_community_memberships.create!(:community_id => community.id)
  end
  
  def join_opportunity!(opportunity, default_confirm = 0)
    self.participations.create!(:opportunity_id => opportunity.id, :confirmed => default_confirm)
  end
  
  def leave_cbo!(cbo)
    self.memberships.find_by_cbo_id(cbo).destroy
  end
  
  def leave_opportunity!(opportunity)
    self.participations.find_by_opportunity_id(opportunity).destroy
  end
  
  def leave_community!(community)
    self.user_community_memberships.find_by_community_id(community).destroy
  end
  
  def part_of_cbo?(cbo)
    # you are only a part of a CBO if you have a confirmed membership
    membership = self.memberships.find_by_cbo_id(cbo)
    if membership
      return membership unless membership.confirmed == 0
    end
  end
  
  def part_of_community?(community)
    return self.user_community_memberships.find_by_community_id(community)
  end
  
  def part_of_opportunity?(opportunity)
    participation = self.participations.find_by_opportunity_id(opportunity)
    if participation
      return participation unless participation.confirmed == 0
    end
  end
  
  def pending_of_cbo?(cbo)
    membership = self.memberships.find_by_cbo_id(cbo)
    if membership
      return membership if membership.confirmed == 0
    end
  end
  
  def pending_of_opportunity?(opportunity)
    participation = self.participations.find_by_opportunity_id(opportunity)
    if participation
      return participation if participation.confirmed == 0
    end
  end
  
  def confirmed_cbos_memberships(confirm_level = 1)
    self.memberships.find_all_by_confirmed(confirm_level)
  end
  
  def confirmed_cbos(confirm_level = 1)
    #self.cbos.find_all_by_confirmed
    
    #first, get the memberships
    #all_memberships = self.memberships.find_all_by_confirmed(confirm_level)
    cbos_list = Array.new
    self.confirmed_cbos_memberships(confirm_level).each do |membership|
      cbos_list.push(membership.cbo_id)
    end
    return Cbo.find_all_by_id(cbos_list)
  end
  
  def pending_cbos_memberships
    self.confirmed_cbos_memberships(0)
  end
  
  def pending_cbos
    self.confirmed_cbos(0)
  end
  
  def confirmed_opportunities_participations(confirm_level = 1)
    self.participations.find_all_by_confirmed(confirm_level)
  end
  
  def confirmed_opportunities(confirm_level = 1)
    
    opportunities_list = Array.new
    self.confirmed_opportunities_participations(confirm_level).each do |participation|
      opportunities_list.push(participation.opportunity_id)
    end
    return Opportunity.find_all_by_id(opportunities_list)
  end
  
  def pending_opportunity_participations
    self.confirmed_opportunity_participations(0)
  end
  
  def pending_opportunities
    self.confirmed_opportunities(0)
  end
  


  
  def confirm!(level=1)
    self.toggle!(:confirmed)
  end
  
  def confirmed?
    self.confirmed != 0
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  
  
  
  private
    
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
  
  
  
end



# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  student                :boolean         default(TRUE)
#  admin                  :boolean         default(FALSE)
#  created_at             :datetime
#  updated_at             :datetime
#  encrypted_password     :string(255)
#  salt                   :string(255)
#  confirmed              :integer         default(0)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  password_salt          :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  failed_attempts        :integer         default(0)
#  unlock_token           :string(255)
#  locked_at              :datetime
#  remember_token         :string(255)
#

