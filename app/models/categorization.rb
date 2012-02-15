

class Categorization < ActiveRecord::Base
  
  belongs_to :category, :class_name => "Category"
  belongs_to :cboprofile,      :class_name => "Cboprofile"
  
end
# == Schema Information
#
# Table name: categorizations
#
#  id            :integer         not null, primary key
#  category_id   :integer
#  cboprofile_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

