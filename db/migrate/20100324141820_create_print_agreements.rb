class CreatePrintAgreements < ActiveRecord::Migration
  def self.up
    create_table :print_agreements do |t|
      t.boolean :print_agree
      t.datetime :print_agree_date
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :print_agreements
  end
end
