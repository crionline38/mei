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

ActiveRecord::Schema.define(version: 20180205143411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disciplines", force: :cascade do |t|
    t.string   "name"
    t.integer  "duree"
    t.integer  "frequence_id"
    t.integer  "tarif1"
    t.integer  "tarif2"
    t.integer  "tarif3"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "valide"
    t.boolean  "fm"
    t.index ["frequence_id"], name: "index_disciplines_on_frequence_id", using: :btree
  end

  create_table "frequences", force: :cascade do |t|
    t.string "name"
  end

  create_table "functions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "year"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id", using: :btree
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
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "year"
    t.string   "address"
    t.string   "tel1"
    t.string   "tel2"
    t.boolean  "rib"
    t.integer  "adhesion_year"
    t.integer  "adhesion_num"
    t.integer  "function_id"
    t.string   "address2"
    t.string   "zipcode"
    t.string   "city"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["function_id"], name: "index_users_on_function_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "students", "users"
  add_foreign_key "users", "functions"
end
