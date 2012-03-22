class CreateParticipationMessages < ActiveRecord::Migration
  def self.up
    create_table :participation_messages do |t|
      t.text :content
      t.integer :participation_id, 'integer unsigned', :null => false
      t.integer :user_or_cbo

      t.timestamps

    end
    
      
    add_index :participation_messages, :participation_id
    
    
  end

  def self.down
    drop_table :participation_messages
  end
end
