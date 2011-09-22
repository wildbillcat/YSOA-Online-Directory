class AddSemesterToWorkstations < ActiveRecord::Migration
  def self.up
    add_column :workstations, :semester, :string
  end

  def self.down
    remove_column :workstations, :semester
  end
end
