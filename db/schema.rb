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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20201216110027) do

  create_table "guests", force: :cascade do |t|
    t.string   "email",         limit: 255
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.string   "phone_numbers", limit: 255, default: "--- []\n"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "guest_id",                   limit: 4
    t.datetime "start_date",                                                                       null: false
    t.datetime "end_date",                                                                         null: false
    t.decimal  "expected_payout_amount",                   precision: 20, scale: 10
    t.text     "guest_details",              limit: 65535
    t.string   "host_currency",              limit: 255
    t.integer  "nights",                     limit: 4,                               default: 0,   null: false
    t.integer  "number_of_guests",           limit: 4,                               default: 1,   null: false
    t.string   "status_type",                limit: 255
    t.decimal  "total_paid_amount_accurate",               precision: 20, scale: 10
    t.datetime "created_at",                                                                       null: false
    t.datetime "updated_at",                                                                       null: false
    t.decimal  "security_price",                           precision: 20, scale: 10, default: 0.0
  end

  add_index "reservations", ["guest_id"], name: "index_reservations_on_guest_id", using: :btree

end
