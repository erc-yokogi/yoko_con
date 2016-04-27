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

ActiveRecord::Schema.define(version: 20160427051713) do

  create_table "contract_haikibutsus", force: true do |t|
    t.string   "haikibutsu"
    t.string   "suryo"
    t.string   "tanka"
    t.integer  "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contract_haikibutsus", ["contract_id"], name: "index_contract_haikibutsus_on_contract_id"

  create_table "contracts", force: true do |t|
    t.string   "itakumoto"
    t.string   "itakusaki"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "itakustart"
    t.string   "itakuend"
  end

  create_table "items", force: true do |t|
    t.string   "item"
    t.string   "tanka"
    t.string   "suryo"
    t.integer  "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["contract_id"], name: "index_items_on_contract_id"

end
