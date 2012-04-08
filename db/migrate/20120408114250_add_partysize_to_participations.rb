class AddPartysizeToParticipations < ActiveRecord::Migration
  def self.up
    add_column :participations, :partysize, :integer, :default => 1
  end

  def self.down
    remove_column :participations, :partysize
  end
end
