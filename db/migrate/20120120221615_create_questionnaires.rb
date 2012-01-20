class CreateQuestionnaires < ActiveRecord::Migration
  def self.up
    create_table :questionnaires do |t|
      t.integer :cbo_id
      t.text :question1_text
      t.text :question2_text
      t.text :question3_text
      t.text :question4_text
      t.text :question5_text
      t.text :question6_text
      t.text :question7_text
      t.text :question8_text
      t.text :question9_text
      t.text :question10
      t.text :additional_instructions

      t.timestamps
    end
  end

  def self.down
    drop_table :questionnaires
  end
end
