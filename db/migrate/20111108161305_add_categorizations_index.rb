class AddCategorizationsIndex < ActiveRecord::Migration
  def self.up
    add_index :categorizations, :category_id
    add_index :categorizations, :cbo_id
  end

  def self.down
    remove_index :categorizations, :category_id
    remove_index :categorizations, :cbo_id
  end
end
