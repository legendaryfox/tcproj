class UniqueCboEmail < ActiveRecord::Migration
  def self.up
    add_index :cbos, :email, :unique => true
  end

  def self.down
    remove_index :cbos, :email
  end
end
