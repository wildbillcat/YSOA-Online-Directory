class AddSidNumberToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :sid_number, :integer
  end

  def self.down
    remove_column :users, :sid_number
  end
end
