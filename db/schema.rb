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

ActiveRecord::Schema.define(version: 20170219022323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "model"
    t.integer  "count"
    t.string   "serial"
    t.float    "price"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "lading_no"
    t.string   "customer"
    t.string   "sales"
    t.string   "address"
    t.string   "telephone"
    t.string   "phone"
    t.string   "item_name"
    t.string   "demand"
    t.date     "purchase_date"
    t.integer  "count"
    t.date     "receiving_date"
    t.date     "installation_date"
    t.string   "inside_no"
    t.string   "outlet_no"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.date     "service_date"
    t.date     "network_date"
    t.date     "appointment"
    t.string   "record_no"
    t.string   "area"
    t.integer  "received_count"
    t.string   "network"
    t.string   "installer"
    t.string   "receipt_audit"
    t.string   "reviewer"
    t.string   "invoice_no"
    t.integer  "year"
    t.integer  "month"
    t.string   "stage"
    t.string   "card_audit"
    t.string   "card_auditor"
    t.string   "installer_s"
    t.string   "completion_note"
    t.string   "sub_file_no"
    t.integer  "status",            default: 0
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "area"
    t.string   "status"
    t.string   "address"
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
