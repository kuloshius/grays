class RenameEncryptedPasswordColumnInUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :encrypted_password, :password_hash
  end
end
