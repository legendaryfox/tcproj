class CreateOpportunities < ActiveRecord::Migration
  def self.up
    create_table :opportunities do |t|
      t.string :name
      t.string :description
      t.integer :cbo_id
      t.integer :questionnaire_id

      t.timestamps
    end
    
    add_index :opportunities, :cbo_id
  end

  def self.down
    drop_table :opportunities
  end
end
