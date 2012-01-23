class Questionnaire < ActiveRecord::Base
  attr_accessible :question1_text, 
                  :question2_text,
                  :question3_text,
                  :question4_text,
                  :question5_text,
                  :question6_text,
                  :question7_text,
                  :question8_text,
                  :question9_text,
                  :question10_text
  attr_accessible :additional_instructions
                  
  #validates :question1_text, :presence => true

                  
  belongs_to :cbo
  has_many :qresponses
  
  
 
  
  
  
end


# == Schema Information
#
# Table name: questionnaires
#
#  id                      :integer         not null, primary key
#  cbo_id                  :integer
#  question1_text          :text
#  question2_text          :text
#  question3_text          :text
#  question4_text          :text
#  question5_text          :text
#  question6_text          :text
#  question7_text          :text
#  question8_text          :text
#  question9_text          :text
#  question10_text         :text
#  additional_instructions :text
#  created_at              :datetime
#  updated_at              :datetime
#

