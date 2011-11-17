class CreateUserprofiles < ActiveRecord::Migration
  def self.up
    create_table :userprofiles do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :userprofiles
  end
end
