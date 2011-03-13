class RedefineStatusAndTypeColumnsForAccounts < ActiveRecord::Migration
  def self.up
    remove_column :accounts, :status_id
    remove_column :accounts, :type_id
    add_column :accounts, :active, :boolean
    add_column :accounts, :type, :string
  end

  def self.down
    add_column :accounts, :status_id, :integer
    add_column :accounts, :type_id, :integer
    remove_column :accounts, :active
    remove_column :accounts, :type
  end
end
