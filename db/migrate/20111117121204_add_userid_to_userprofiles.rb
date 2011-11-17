class AddUseridToUserprofiles < ActiveRecord::Migration
  def self.up
    add_column :userprofiles, :user_id, :integer
    add_index :userprofiles, :user_id, :unique => true
  end

  def self.down
    remove_column :userprofiles, :user_id
  end
end
