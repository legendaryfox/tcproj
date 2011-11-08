class CreateCbos < ActiveRecord::Migration
  def self.up
    create_table :cbos do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :cbos
  end
end
