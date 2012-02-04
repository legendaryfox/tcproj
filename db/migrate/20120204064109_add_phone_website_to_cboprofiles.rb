class AddPhoneWebsiteToCboprofiles < ActiveRecord::Migration
  def self.up
    add_column :cboprofiles, :phone, :string
    add_column :cboprofiles, :website, :string
  end

  def self.down
    remove_column :cboprofiles, :website
    remove_column :cboprofiles, :phone
  end
end
