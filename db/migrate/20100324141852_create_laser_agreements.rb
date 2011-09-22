class CreateLaserAgreements < ActiveRecord::Migration
  def self.up
    create_table :laser_agreements do |t|
      t.boolean :laser_agree
      t.datetime :laser_agree_date
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :laser_agreements
  end
end
