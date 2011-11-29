class SeparateCboAddressToFields < ActiveRecord::Migration
  def self.up
    remove_column :cboprofiles, :address
    add_column :cboprofiles, :street1, :string
    add_column :cboprofiles, :street2, :string
    add_column :cboprofiles, :city, :string
    add_column :cboprofiles, :state, :string
    add_column :cboprofiles, :zip, :string
    add_column :cboprofiles, :country, :string
    
    add_column :userprofiles, :street1, :string
    add_column :userprofiles, :street2, :string
    add_column :userprofiles, :city, :string
    add_column :userprofiles, :state, :string
    add_column :userprofiles, :zip, :string
    add_column :userprofiles, :country, :string
    
  end

  def self.down
    add_column :cboprofiles, :address, :string
    remove_column :cboprofiles, :street1
    remove_column :cboprofiles, :street2
    remove_column :cboprofiles, :city
    remove_column :cboprofiles, :state
    remove_column :cboprofiles, :zip
    remove_column :cboprofiles, :country
    
    remove_column :userprofiles, :street1
    remove_column :userprofiles, :street2
    remove_column :userprofiles, :city
    remove_column :userprofiles, :state
    remove_column :userprofiles, :zip
    remove_column :userprofiles, :country
    
  end
end
