class MakeDefaultStatusToParticipations < ActiveRecord::Migration
  def self.up
    change_column :participations, :status, :integer, :default => 0 
  end

  def self.down
    change_column :participations, :status, :integer, :default => nil
  end
end
