class AddLatitudeLongitudeToUsers < ActiveRecord::Migration
  def self.up
    add_column :userprofiles, :latitude, :float
    add_column :userprofiles, :longitude, :float
  end

  def self.down
    remove_column :userprofiles, :longitude
    remove_column :userprofiles, :latitude
  end
end
