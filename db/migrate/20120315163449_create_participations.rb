class CreateParticipations < ActiveRecord::Migration
  def self.up
    create_table :participations do |t|
      t.integer :user_id
      t.integer :cbo_id
      t.integer :status
      t.text :monday
      t.text :tuesday
      t.text :wednesday
      t.text :thursday
      t.text :friday
      t.text :saturday
      t.text :sunday

      t.timestamps
    end
  end

  def self.down
    drop_table :participations
  end
end
