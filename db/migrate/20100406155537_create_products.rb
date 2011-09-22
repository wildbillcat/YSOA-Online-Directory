class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.integer :transaction_id

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
