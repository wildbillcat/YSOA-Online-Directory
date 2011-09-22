class AddNotesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :dean_notes, :string
    add_column :users, :dm_notes, :string
  end

  def self.down
    remove_column :users, :dm_notes
    remove_column :users, :dean_notes
  end
end
