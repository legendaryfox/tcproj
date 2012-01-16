require 'spec_helper'

describe Opportunity do
  pending "add some examples to (or delete) #{__FILE__}"
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

