class AddZipToCommunities < ActiveRecord::Migration
  def self.up
    add_column :communities, :zip, :string
  end

  def self.down
    remove_column :communities, :zip
  end
end
