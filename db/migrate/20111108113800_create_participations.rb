class CreateParticipations < ActiveRecord::Migration
  def self.up
    create_table :participations do |t|
      t.integer :student_id
      t.integer :cbo_id

      t.timestamps
    end
    add_index :participations, :student_id
    add_index :participations, :cbo_id
    
  end

  def self.down
    drop_table :participations
  end
end
