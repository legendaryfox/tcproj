class AddConfirmedToFields < ActiveRecord::Migration
  def self.up
    add_column :cbos, :confirmed, :integer, :default => 0
    add_column :memberships, :confirmed, :integer, :default => 0
    add_column :users, :confirmed, :integer, :default => 0
  end

  def self.down
    remove_column :cbos, :confirmed
    remove_column :memberships, :confirmed
    remove_colum :users, :confirmed
  end
end
