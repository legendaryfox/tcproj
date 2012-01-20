class RenameQuestionResponse < ActiveRecord::Migration
  def self.up
    rename_column :userprofiles, :question1, :question1_response
    rename_column :userprofiles, :question2, :question2_response
    rename_column :userprofiles, :question3, :question3_response
    rename_column :userprofiles, :question4, :question4_response
  end

  def self.down
    rename_column :userprofiles, :question1_response, :question1
    rename_column :userprofiles, :question2_response, :question2
    rename_column :userprofiles, :question3_response, :question3
    rename_column :userprofiles, :question4_response, :question4
  end
end
