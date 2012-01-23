class CreateQresponses < ActiveRecord::Migration
  def self.up
    create_table :qresponses do |t|
      t.integer :user_id
      t.integer :questionnaire_id
      t.text :question1_text
      t.text :question1_response
      t.text :question2_text
      t.text :question2_response
      t.text :question3_text
      t.text :question3_response
      t.text :question4_text
      t.text :question4_response
      t.text :question5_text
      t.text :question5_response
      t.text :question6_text
      t.text :question6_response
      t.text :question7_text
      t.text :question7_response
      t.text :question8_text
      t.text :question8_response
      t.text :question9_text
      t.text :question9_response
      t.text :question10_text
      t.text :question10_response

      t.timestamps
    end
  end

  def self.down
    drop_table :qresponses
  end
end
