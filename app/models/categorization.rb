

# == Schema Information
#
# Table name: categorizations
#
#  id          :integer         not null, primary key
#  category_id :integer
#  cbo_id      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Categorization < ActiveRecord::Base
  
  belongs_to :category, :class_name => "Category"
  belongs_to :cbo,      :class_name => "Cbo"
  
end