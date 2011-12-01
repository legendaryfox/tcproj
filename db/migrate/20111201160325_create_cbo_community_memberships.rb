class CreateCboCommunityMemberships < ActiveRecord::Migration
  def self.up
    create_table :cbo_community_memberships do |t|
      t.integer :cbo_id
      t.integer :community_id

      t.timestamps
    end
    
    add_index :cbo_community_memberships, :cbo_id
    add_index :cbo_community_memberships, :community_id
    add_index :cbo_community_memberships, [:cbo_id, :community_id], :unique => true
  end

  def self.down
    drop_table :cbo_community_memberships
  end
end
