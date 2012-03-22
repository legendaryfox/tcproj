class AddUserAndCboIdsToParticipationMessages < ActiveRecord::Migration
  def self.up
    add_column :participation_messages, :user_id, :integer
    add_column :participation_messages, :cbo_id, :integer
    add_index :participation_messages, :user_id
    add_index :participation_messages, :cbo_id
  end

  def self.down
    remove_column :participation_messages, :cbo_id
    remove_column :participation_messages, :user_id
  end
end
