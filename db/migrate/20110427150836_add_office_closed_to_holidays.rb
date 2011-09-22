class AddOfficeClosedToHolidays < ActiveRecord::Migration
  def self.up
    add_column :holidays, :office_closed, :boolean
  end

  def self.down
    remove_column :holidays, :office_closed
  end
end
