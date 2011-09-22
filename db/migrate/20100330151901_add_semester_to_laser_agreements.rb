class AddSemesterToLaserAgreements < ActiveRecord::Migration
  def self.up
    add_column :laser_agreements, :semester, :string
  end

  def self.down
    remove_column :laser_agreements, :semester
  end
end
