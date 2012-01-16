class AddFieldsToOpportunities < ActiveRecord::Migration
  def self.up
    add_column :opportunities, :start_date, :datetime
    add_column :opportunities, :end_date, :datetime
    add_column :opportunities, :address, :string
    add_column :opportunities, :latitude, :float
    add_column :opportunities, :longitude, :float
    add_column :opportunities, :information, :text
  end

  def self.down
    remove_column :opportunities, :information
    remove_column :opportunities, :longitude
    remove_column :opportunities, :latitude
    remove_column :opportunities, :address
    remove_column :opportunities, :end_date
    remove_column :opportunities, :start_date
  end
end
