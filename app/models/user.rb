
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
  
  has_one :userprofile
  
  accepts_nested_attributes_for :userprofile
  
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def join_cbo!(cbo)
    self.memberships.create!(:cbo_id => cbo.id)
  end
  
  def leave_cbo!(cbo)
    self.memberships.find_by_cbo_id(cbo).destroy
  end
  
  def part_of_cbo?(cbo)
    memberships.find_by_cbo_id(cbo)
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
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  student            :boolean         default(TRUE)
#  admin              :boolean         default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#  confirmed          :integer         default(0)
#

