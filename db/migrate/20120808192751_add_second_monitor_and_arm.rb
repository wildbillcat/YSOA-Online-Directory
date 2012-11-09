class AddSecondMonitorAndArm < ActiveRecord::Migration
  def self.up
    add_column :workstations, :monitor_number2, :string
    add_column :workstations, :arm_number2, :string
  end

  def self.down
    remove_column :workstations, :monitor_number2
    remove_column :workstations, :arm_number2
  end
end
