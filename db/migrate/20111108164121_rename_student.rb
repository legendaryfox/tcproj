class RenameStudent < ActiveRecord::Migration
  def self.up
    rename_column :participations, :student_id, :user_id
  end

  def self.down
    rename_column :participations, :user_id, :student_id
  end
end
