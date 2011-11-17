class AddFieldsToUserprofiles < ActiveRecord::Migration
  def self.up
    add_column :userprofiles, :firstname, :string
    add_column :userprofiles, :lastname, :string
    add_column :userprofiles, :nickname, :string
  end

  def self.down
    remove_column :userprofiles, :nickname
    remove_column :userprofiles, :lastname
    remove_column :userprofiles, :firstname
  end
end
