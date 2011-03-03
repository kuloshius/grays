class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :reference, :null => false
      t.string :name, :null => false
      t.string :street
      t.string :city
      t.string :county
      t.string :postcode
      t.references :status
      t.references :parent
      t.decimal :credit_limit, :precision => 11, :scale => 2
      t.integer :payment_delay
      t.boolean :in_advance
      t.references :type

      t.timestamps
    end
    add_index :accounts, :reference, :unique => true, :name => 'reference_ix'
    add_index :accounts, :status_id, :name => 'status_ix'
    add_index :accounts, :parent_id, :name => 'parent_ix'
    add_index :accounts, :type_id, :name => 'type_ix'
  end

  def self.down
    drop_table :accounts
  end
end
