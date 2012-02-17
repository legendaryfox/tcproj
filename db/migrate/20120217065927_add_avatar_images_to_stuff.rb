class AddAvatarImagesToStuff < ActiveRecord::Migration
  def self.up
    change_table :cboprofiles do |t|
      t.has_attached_file :cbo_avatar
    end
    
    change_table :communities do |t|
      t.has_attached_file :community_avatar
    end
    
  end

  def self.down
    drop_attached_file :cboprofiles, :cbo_avatar
    drop_attached_file :communities, :community_avatar
  end
end
