class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :netid
      t.string :image_url
      t.string :email
      t.integer :class_year
      t.string :program
      t.integer :program_year
      t.string :undergrad_college
      t.integer :workstation_id
      t.integer :equip_agreement_id
      t.integer :print_agreement_id
      t.integer :laser_agreement_id
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
