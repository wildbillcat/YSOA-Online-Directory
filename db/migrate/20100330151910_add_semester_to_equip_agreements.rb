class AddSemesterToEquipAgreements < ActiveRecord::Migration
  def self.up
    add_column :equip_agreements, :semester, :string
  end

  def self.down
    remove_column :equip_agreements, :semester
  end
end
