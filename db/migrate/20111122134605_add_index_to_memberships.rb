class AddIndexToMemberships < ActiveRecord::Migration
  def self.up
    add_index :memberships, :user_id
    add_index :memberships, :cbo_id
    
  end

  def self.down
    remove_index :memberships, :user_id
    remove_index :memberships, :cbo_id
  end
end
