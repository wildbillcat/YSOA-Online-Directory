class CreateWorkstations < ActiveRecord::Migration
  def self.up
    create_table :workstations do |t|
      t.integer :cpu_number
      t.string :monitor_number
      t.string :arm_number
      t.text :cpu_damage
      t.text :monitor_damage
      t.text :arm_damage
      t.integer :floor
      t.string :studio
      t.datetime :registration_date
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :workstations
  end
end
