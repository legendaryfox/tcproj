class RemoveErroroneousColumnFromParticipationMessages < ActiveRecord::Migration
  def self.up
    remove_column :participation_messages, :integer
    rename_column :participation_messages, :content, :message
  end

  def self.down
    add_column :participation_messages, :integer
    rename_column :participation_messages, :message, :content
  end
end
