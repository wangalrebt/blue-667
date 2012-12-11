# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121211063521) do

  create_table "carts", :force => true do |t|
    t.integer  "users_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "completed",  :default => false
  end

  create_table "carts_products", :force => true do |t|
    t.integer  "cart_id"
    t.integer  "quantity",    :default => 1
    t.integer  "product_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "order_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cart_id"
    t.integer  "order_type"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "completed",       :default => false
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
  end

  create_table "product_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.string   "picture"
    t.integer  "product_type"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "reservations", :force => true do |t|
    t.integer  "user_id"
    t.datetime "start_date"
    t.integer  "number_of_tables"
    t.integer  "order_id"
    t.string   "name"
    t.integer  "phone"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "cart_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "specialists", :force => true do |t|
    t.datetime "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "specialists_products", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "specialist_id"
  end

  create_table "user_addresses", :force => true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "address_type"
    t.integer  "user_id"
    t.integer  "order_id"
    t.string   "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
