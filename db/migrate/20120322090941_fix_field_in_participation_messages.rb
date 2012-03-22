class FixFieldInParticipationMessages < ActiveRecord::Migration
  def self.up
    remove_column :participation, 'integer unsigned'
  end

  def self.down
    add_column :participation, 'integer unsigned'
  end
end
