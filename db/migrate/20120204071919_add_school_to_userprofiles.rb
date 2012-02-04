class AddSchoolToUserprofiles < ActiveRecord::Migration
  def self.up
    add_column :userprofiles, :school, :string
  end

  def self.down
    remove_column :userprofiles, :school
  end
end
