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

ActiveRecord::Schema.define(version: 20161220012412) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.string   "username"
    t.string   "phone"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_admin_users_on_username", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "model"
    t.integer  "count"
    t.string   "serial"
    t.float    "price"
    t.string   "description"
    t.integer  "order_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["order_id"], name: "index_items_on_order_id"
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
    t.integer  "team_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["team_id"], name: "index_orders_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
