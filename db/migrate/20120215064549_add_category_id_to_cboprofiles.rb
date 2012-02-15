class AddCategoryIdToCboprofiles < ActiveRecord::Migration
  def self.up
    add_column :cboprofiles, :category_id, :integer
  end

  def self.down
    remove_column :cboprofiles, :category_id
  end
end
