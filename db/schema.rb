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

ActiveRecord::Schema.define(version: 20161222195840) do

  create_table "items", force: :cascade do |t|
    t.integer  "skuid"
    t.string   "description"
    t.decimal  "price"
    t.decimal  "length"
    t.decimal  "width"
    t.decimal  "height"
    t.decimal  "weight"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "multiple"
    t.string   "profitable"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "szip"
    t.integer  "dzip"
    t.decimal  "onelbs"
    t.decimal  "twolbs"
    t.decimal  "fivelbs"
    t.decimal  "tenlbs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "state1"
    t.string   "state2"
  end

end
