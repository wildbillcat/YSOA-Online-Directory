class CreateEquipAgreements < ActiveRecord::Migration
  def self.up
    create_table :equip_agreements do |t|
      t.boolean :equip_agree
      t.datetime :equip_agree_date
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :equip_agreements
  end
end
