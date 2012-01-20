class RenameQuestion10 < ActiveRecord::Migration
  def self.up
    rename_column :questionnaires, :question10, :question10_text
  end

  def self.down
    rename_column :questionnaires, :question10_text, :question10
  end
end
