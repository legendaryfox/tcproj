class AddPasswordToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :encrypt_password, :string
  end

  def self.down
    remove_column :users, :encrypt_password
  end
end
