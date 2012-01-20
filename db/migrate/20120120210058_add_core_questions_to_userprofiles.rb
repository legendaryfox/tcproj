class AddCoreQuestionsToUserprofiles < ActiveRecord::Migration
  def self.up
    add_column :userprofiles, :question1, :text
    add_column :userprofiles, :question2, :text
    add_column :userprofiles, :question3, :text
    add_column :userprofiles, :question4, :text
  end

  def self.down
    remove_column :userprofiles, :question4
    remove_column :userprofiles, :question3
    remove_column :userprofiles, :question2
    remove_column :userprofiles, :question1
  end
end
