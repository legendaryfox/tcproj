class FixPMsForReal < ActiveRecord::Migration
  def self.up
    remove_column :participation_messages, 'integer unsigned'
  end

  def self.down
    add_column :participation_messages, 'integer unsigned'
  end
end
