class AddExtendedCheckoutToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :extended_checkout, :boolean
  end

  def self.down
    remove_column :transactions, :extended_checkout
  end
end
