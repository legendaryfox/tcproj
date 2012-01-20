class RenameQuestionToCoreQ < ActiveRecord::Migration
  def self.up
    rename_column :userprofiles, :question1_response, :core_question1_response
    rename_column :userprofiles, :question2_response, :core_question2_response
    rename_column :userprofiles, :question3_response, :core_question3_response
    rename_column :userprofiles, :question4_response, :core_question4_response
    
  end

  def self.down
    rename_column :userprofiles, :core_question1_response, :question1_response
    rename_column :userprofiles, :core_question2_response, :question2_response
    rename_column :userprofiles, :core_question3_response, :question3_response
    rename_column :userprofiles, :core_question4_response, :question4_response
  end
end
