class AddResponsesToMemberships < ActiveRecord::Migration
  def self.up
    add_column :memberships, :question1_text, :text
    add_column :memberships, :question1_response, :text
  end

  def self.down
    remove_column :memberships, :question1_response
    remove_column :memberships, :question1_text
  end
end
