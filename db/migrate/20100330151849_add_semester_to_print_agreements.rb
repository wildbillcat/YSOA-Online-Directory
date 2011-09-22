class AddSemesterToPrintAgreements < ActiveRecord::Migration
  def self.up
    add_column :print_agreements, :semester, :string
  end

  def self.down
    remove_column :print_agreements, :semester
  end
end
