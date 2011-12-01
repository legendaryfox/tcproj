class CreateCommunities < ActiveRecord::Migration
  def self.up
    create_table :communities do |t|
      t.string :name
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    
    add_index :communities, :name
    add_index :communities, :city
    add_index :communities, :state
    
  end

  def self.down
    drop_table :communities
  end
end
