class ChangeParticipation < ActiveRecord::Migration
  def self.up
    rename_column :participations, :cbo_id, :opportunity_id
    add_column :participations, :confirmed, :integer, :default => 0
  end

  def self.down
    rename_column :participations, :opportunity_id, :cbo_id
    remove_column :participations, :confirmed
  end
end
