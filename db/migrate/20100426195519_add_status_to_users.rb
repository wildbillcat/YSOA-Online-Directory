class AddStatusToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :status, :string
    add_column :users, :graduation_date, :date
    add_column :users, :position, :string
  end

  def self.down
    remove_column :users, :status
    remove_column :users, :graduation_date
    remove_column :users, :position
  end
end
