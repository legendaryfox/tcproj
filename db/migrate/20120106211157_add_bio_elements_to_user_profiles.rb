class AddBioElementsToUserProfiles < ActiveRecord::Migration
  def self.up
    add_column :userprofiles, :short_bio, :text
    add_column :userprofiles, :long_bio, :text
  end

  def self.down
    remove_column :userprofiles, :long_bio
    remove_column :userprofiles, :short_bio
  end
end
