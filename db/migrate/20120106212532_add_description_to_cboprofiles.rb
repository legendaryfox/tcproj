class AddDescriptionToCboprofiles < ActiveRecord::Migration
  def self.up
    add_column :cboprofiles, :information, :text
    add_column :cboprofiles, :location_notes, :text
    add_column :cboprofiles, :how_to_volunteer, :text
  end

  def self.down
    remove_column :cboprofiles, :how_to_volunteer
    remove_column :cboprofiles, :location_notes
    remove_column :cboprofiles, :information
  end
end
