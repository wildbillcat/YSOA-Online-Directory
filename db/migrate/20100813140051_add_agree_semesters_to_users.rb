class AddAgreeSemestersToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :last_equip_agree_semester, :string
    add_column :users, :last_laser_agree_semester, :string
    add_column :users, :last_print_agree_semester, :string
  end

  def self.down
    remove_column :users, :last_equip_agree_semester
    remove_column :users, :last_laser_agree_semester
    remove_column :users, :last_print_agree_semester
  end
end
