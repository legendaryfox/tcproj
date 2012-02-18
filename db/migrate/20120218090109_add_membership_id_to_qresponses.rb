class AddMembershipIdToQresponses < ActiveRecord::Migration
  def self.up
    add_column :qresponses, :membership_id, :integer
  end

  def self.down
    remove_column :qresponses, :membership_id
  end
end
