class AddNetidToWorkstations < ActiveRecord::Migration
  def self.up
    add_column :workstations, :netid, :string
  end

  def self.down
    remove_column :workstations, :netid
  end
end
