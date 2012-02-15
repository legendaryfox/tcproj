class ChangeCategorizations < ActiveRecord::Migration
  def self.up
    rename_column :categorizations, :cbo_id, :cboprofile_id
  end

  def self.down
    rename_column :categorizations, :cboprofile_id, :cbo_id
  end
end
