require 'spec_helper'

describe Membership do
  pending "add some examples to (or delete) #{__FILE__}"
end



# == Schema Information
#
# Table name: memberships
#
#  id                 :integer         not null, primary key
#  user_id            :integer
#  cbo_id             :integer
#  created_at         :datetime
#  updated_at         :datetime
#  confirmed          :integer         default(0)
#  question1_text     :text
#  question1_response :text
#

