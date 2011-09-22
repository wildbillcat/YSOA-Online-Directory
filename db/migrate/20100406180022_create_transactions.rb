class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string :product_name
      t.date :checkout_date
      t.date :checkin_date
      t.date :due_date
      t.integer :days_late
      t.string :borrower_netid
      t.integer :student_id
      t.integer :product_id
      t.text :notes
      t.string :checkout_by
      t.string :checkin_by

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
