

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
#

class Opportunity < ActiveRecord::Base
  attr_accessible :name, :description
  
  belongs_to :cbo
end
