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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170409235715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.string   "unit"
    t.string   "model"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "info_no"
    t.string   "lading_no"
    t.datetime "create_time"
    t.string   "customer"
    t.string   "area_code"
    t.string   "phone"
    t.string   "province"
    t.string   "city"
    t.string   "county"
    t.string   "street"
    t.string   "address"
    t.string   "category"
    t.integer  "count"
    t.integer  "uncount"
    t.datetime "purchase_date"
    t.string   "customer_attribute"
    t.string   "sale_type"
    t.string   "sale_no"
    t.string   "sale_name"
    t.string   "expected_time"
    t.string   "create_network_no"
    t.string   "create_network"
    t.datetime "service_date"
    t.string   "service_network_no"
    t.string   "service_network"
    t.string   "status"
    t.string   "note"
    t.string   "other_note"
    t.string   "finished_time"
    t.string   "item_type"
    t.integer  "item_count"
    t.float    "item_price"
    t.string   "item_type2"
    t.integer  "item_count2"
    t.float    "item_price2"
    t.string   "item_type3"
    t.integer  "item_count3"
    t.float    "item_price3"
    t.datetime "dispatch_time"
    t.datetime "recall_time"
    t.string   "recall_note"
    t.string   "team_name"
    t.string   "team_phone"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.float    "lng"
    t.float    "lat"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "tel"
    t.string   "note"
    t.string   "area"
    t.string   "address"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
