class RenameColumnParentToAccountInAccounts < ActiveRecord::Migration
  def self.up
    rename_column :accounts, :parent_id, :account_id
  end

  def self.down
    rename_column :accounts, :account_id, :parent_id
  end
end
