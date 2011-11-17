

class Cbo < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name,  :presence => true,
                    :length => { :maximum => 32 }
                    
  validates :email, :presence => true,
            :format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false }
            
  validates :password,  :presence => true,
                        :confirmation => true,
                        :length => { :within => 6..10 }
                        
  before_save :encrypt_password
                    
  has_many :opportunities
  
  has_many :participations #, :foreign_key => "cbo_id"
  has_many :users, :through => :participations, :source => :user
  
  has_many :categorizations, :foreign_key => "cbo_id"
  has_many :categories, :through => :categorizations, :source => :category
                    
  def add_to_category!(category)
    self.categorizations.create!(:category_id => category.id)
  end
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    cbo = find_by_email(email)
    return nil if cbo.nil?
    return cbo if cbo.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    cbo = find_by_id(id)
    (cbo && cbo.salt == cookie_salt) ? cbo : nil
  end
  
  private
  
    
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
    def encrypt_password
       self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
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
# Table name: cbos
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

