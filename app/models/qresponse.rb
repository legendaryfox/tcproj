
class Qresponse < ActiveRecord::Base
=begin
  attr_accessible :user_id
  attr_accessible :membership_id
  attr_accessible :questionnaire_id
  
  attr_accessible :question1_text, :question1_response
  attr_accessible :question2_text, :question2_response
  attr_accessible :question3_text, :question3_response
  attr_accessible :question4_text, :question4_response
  attr_accessible :question5_text, :question5_response
  attr_accessible :question6_text, :question6_response
  attr_accessible :question7_text, :question7_response
  attr_accessible :question8_text, :question8_response
  attr_accessible :question9_text, :question9_response
  attr_accessible :question10_text, :question10_response
  
  
  belongs_to :user, :class_name => "User"
  belongs_to :questionnaire, :class_name => "Questionnaire"
  belongs_to :membership, :class_name => "Membership"
  
=end  
end


# == Schema Information
#
# Table name: qresponses
#
#  id                  :integer         not null, primary key
#  user_id             :integer
#  questionnaire_id    :integer
#  question1_text      :text
#  question1_response  :text
#  question2_text      :text
#  question2_response  :text
#  question3_text      :text
#  question3_response  :text
#  question4_text      :text
#  question4_response  :text
#  question5_text      :text
#  question5_response  :text
#  question6_text      :text
#  question6_response  :text
#  question7_text      :text
#  question7_response  :text
#  question8_text      :text
#  question8_response  :text
#  question9_text      :text
#  question9_response  :text
#  question10_text     :text
#  question10_response :text
#  created_at          :datetime
#  updated_at          :datetime
#  membership_id       :integer
#

