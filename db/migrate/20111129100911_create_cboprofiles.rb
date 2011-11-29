class CreateCboprofiles < ActiveRecord::Migration
  def self.up
    create_table :cboprofiles do |t|
      t.string :name
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :cbo_id

      t.timestamps
    end
    add_index :cboprofiles, :cbo_id
  end

  def self.down
    drop_table :cboprofiles
  end
end
