class AddPreferencesColumnToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :preferences, :string
  end

  def self.down
    remove_column :users, :preferences
  end
end
