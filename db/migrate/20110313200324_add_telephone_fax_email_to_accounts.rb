class AddTelephoneFaxEmailToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :phone, :string
    add_column :accounts, :email, :string
    add_column :accounts, :fax, :string
  end

  def self.down
    remove_column :accounts, :phone
    remove_column :accounts, :email
    remove_column :accounts, :fax
  end
end
