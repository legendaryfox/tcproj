class AddEncryptedPasswordToCbo < ActiveRecord::Migration
  def self.up
    add_column :cbos, :encrypted_password, :string
  end

  def self.down
    remove_column :cbos, :encrypted_password
  end
end
