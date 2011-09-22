class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.integer :user_id
      t.integer :parent_id
      t.integer :size
      t.integer :width
      t.integer :height
      t.string :content_type
      t.string :filename
      t.string :thumbnail
      t.string :collection
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
