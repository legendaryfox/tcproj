require 'spec_helper'

describe Userprofile do
  pending "add some examples to (or delete) #{__FILE__}"
end




# == Schema Information
#
# Table name: userprofiles
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  firstname  :string(255)
#  lastname   :string(255)
#  nickname   :string(255)
#  user_id    :integer
#  street1    :string(255)     default("")
#  street2    :string(255)     default("")
#  city       :string(255)     default("")
#  state      :string(255)     default("")
#  zip        :string(255)     default("")
#  country    :string(255)     default("")
#  latitude   :float
#  longitude  :float
#

