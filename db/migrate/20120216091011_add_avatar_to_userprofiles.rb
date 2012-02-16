class AddAvatarToUserprofiles < ActiveRecord::Migration
  def self.up
    change_table :userprofiles do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :userprofiles, :avatar
  end
end
