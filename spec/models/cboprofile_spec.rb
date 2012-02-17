require 'spec_helper'

describe Cboprofile do
  pending "add some examples to (or delete) #{__FILE__}"
end







# == Schema Information
#
# Table name: cboprofiles
#
#  id                      :integer         not null, primary key
#  name                    :string(255)
#  description             :text
#  latitude                :float
#  longitude               :float
#  cbo_id                  :integer
#  created_at              :datetime
#  updated_at              :datetime
#  street1                 :string(255)     default("")
#  street2                 :string(255)     default("")
#  city                    :string(255)     default("")
#  state                   :string(255)     default("")
#  zip                     :string(255)     default("")
#  country                 :string(255)     default("")
#  information             :text
#  location_notes          :text
#  how_to_volunteer        :text
#  phone                   :string(255)
#  website                 :string(255)
#  category_id             :integer
#  cbo_avatar_file_name    :string(255)
#  cbo_avatar_content_type :string(255)
#  cbo_avatar_file_size    :integer
#  cbo_avatar_updated_at   :datetime
#

