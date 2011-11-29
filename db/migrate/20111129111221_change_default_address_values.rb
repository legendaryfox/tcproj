class ChangeDefaultAddressValues < ActiveRecord::Migration
  def self.up
    change_column :cboprofiles, :street1, :string, :default => ''
    change_column :cboprofiles, :street2, :string, :default => ''
    change_column :cboprofiles, :city, :string, :default => ''
    change_column :cboprofiles, :state, :string, :default => ''
    change_column :cboprofiles, :zip, :string, :default => ''
    change_column :cboprofiles, :country, :string, :default => ''
    
    change_column :userprofiles, :street1, :string, :default => ''
    change_column :userprofiles, :street2, :string, :default => ''
    change_column :userprofiles, :city, :string, :default => ''
    change_column :userprofiles, :state, :string, :default => ''
    change_column :userprofiles, :zip, :string, :default => ''
    change_column :userprofiles, :country, :string, :default => ''
    
  end

  def self.down
    
    change_column :cboprofiles, :street1, :string, :default => nil
    change_column :cboprofiles, :street2, :string, :default => nil
    change_column :cboprofiles, :city, :string, :default => nil
    change_column :cboprofiles, :state, :string, :default => nil
    change_column :cboprofiles, :zip, :string, :default => nil
    change_column :cboprofiles, :country, :string, :default => nil
    
    change_column :userprofiles, :street1, :string, :default => nil
    change_column :userprofiles, :street2, :string, :default => nil
    change_column :userprofiles, :city, :string, :default => nil
    change_column :userprofiles, :state, :string, :default => nil
    change_column :userprofiles, :zip, :string, :default => nil
    change_column :userprofiles, :country, :string, :default => nil
    
  end
end
