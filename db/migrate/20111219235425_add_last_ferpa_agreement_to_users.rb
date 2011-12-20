class AddLastFerpaAgreementToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :last_ferpa_agreement, :date
  end

  def self.down
    remove_column :users, :last_ferpa_agreement
  end
end
