# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110628201504) do

  create_table "accounts", :force => true do |t|
    t.string   "reference",                                    :null => false
    t.string   "name",                                         :null => false
    t.string   "street"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.integer  "account_id"
    t.decimal  "credit_limit",  :precision => 11, :scale => 2
    t.integer  "payment_delay"
    t.boolean  "in_advance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.string   "phone"
    t.string   "email"
    t.string   "fax"
  end

  add_index "accounts", ["account_id"], :name => "parent_ix"
  add_index "accounts", ["reference"], :name => "reference_ix", :unique => true

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "association_id"
    t.string   "association_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",          :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["association_id", "association_type"], :name => "association_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "users", :force => true do |t|
    t.string   "email",                        :default => "", :null => false
    t.string   "password_hash", :limit => 128, :default => "", :null => false
    t.string   "password_salt",                :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
