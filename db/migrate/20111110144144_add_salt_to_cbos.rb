class AddSaltToCbos < ActiveRecord::Migration
  def self.up
    add_column :cbos, :salt, :string
  end

  def self.down
    remove_column :cbos, :salt
  end
end
