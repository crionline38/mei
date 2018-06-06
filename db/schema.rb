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

ActiveRecord::Schema.define(version: 20180327085335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adhesions", force: :cascade do |t|
    t.integer  "year_id"
    t.integer  "user_id"
    t.boolean  "pay",        default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_adhesions_on_user_id", using: :btree
    t.index ["year_id"], name: "index_adhesions_on_year_id", using: :btree
  end

  create_table "cours", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "discipline_id"
    t.integer  "instrument_id"
    t.integer  "user_id"
    t.integer  "year_id"
    t.boolean  "plus"
    t.boolean  "eco"
    t.string   "dispo"
    t.integer  "nbstudents"
    t.integer  "nbstudentshyp"
    t.time     "heure"
    t.time     "heurehyp"
    t.integer  "recurence"
    t.integer  "recurencehyp"
    t.boolean  "soumettre"
    t.string   "comments"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["discipline_id"], name: "index_cours_on_discipline_id", using: :btree
    t.index ["instrument_id"], name: "index_cours_on_instrument_id", using: :btree
    t.index ["student_id"], name: "index_cours_on_student_id", using: :btree
    t.index ["user_id"], name: "index_cours_on_user_id", using: :btree
    t.index ["year_id"], name: "index_cours_on_year_id", using: :btree
  end

  create_table "crenaus", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "year_id"
    t.boolean  "valide",        default: false
    t.integer  "discipline_id"
    t.integer  "instrument_id"
    t.integer  "jour",          default: 0
    t.integer  "recurence",     default: 0
    t.time     "start",         default: '2000-01-01 00:00:00'
    t.time     "end",           default: '2000-01-01 00:00:00'
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["discipline_id"], name: "index_crenaus_on_discipline_id", using: :btree
    t.index ["instrument_id"], name: "index_crenaus_on_instrument_id", using: :btree
    t.index ["user_id"], name: "index_crenaus_on_user_id", using: :btree
    t.index ["year_id"], name: "index_crenaus_on_year_id", using: :btree
  end

  create_table "disciplines", force: :cascade do |t|
    t.string   "name"
    t.integer  "duree"
    t.integer  "frequence_id"
    t.integer  "tarif_id"
    t.boolean  "valide",       default: true
    t.boolean  "fm"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["frequence_id"], name: "index_disciplines_on_frequence_id", using: :btree
    t.index ["tarif_id"], name: "index_disciplines_on_tarif_id", using: :btree
  end

  create_table "frequences", force: :cascade do |t|
    t.string "name"
  end

  create_table "functions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruds", force: :cascade do |t|
    t.integer  "instrument_id"
    t.integer  "discipline_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["discipline_id"], name: "index_instruds_on_discipline_id", using: :btree
    t.index ["instrument_id"], name: "index_instruds_on_instrument_id", using: :btree
  end

  create_table "instruments", force: :cascade do |t|
    t.string   "name"
    t.boolean  "valide",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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

  create_table "tarifs", force: :cascade do |t|
    t.string   "name"
    t.float    "a"
    t.float    "b"
    t.float    "c"
    t.boolean  "valide",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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
    t.string   "address2"
    t.string   "zipcode"
    t.string   "city"
    t.integer  "function_id",            default: 1
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["function_id"], name: "index_users_on_function_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "years", force: :cascade do |t|
    t.string   "name"
    t.boolean  "valide",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_foreign_key "adhesions", "users"
  add_foreign_key "adhesions", "years"
  add_foreign_key "cours", "disciplines"
  add_foreign_key "cours", "instruments"
  add_foreign_key "cours", "students"
  add_foreign_key "cours", "users"
  add_foreign_key "cours", "years"
  add_foreign_key "crenaus", "disciplines"
  add_foreign_key "crenaus", "instruments"
  add_foreign_key "crenaus", "users"
  add_foreign_key "crenaus", "years"
  add_foreign_key "instruds", "disciplines"
  add_foreign_key "instruds", "instruments"
  add_foreign_key "students", "users"
  add_foreign_key "users", "functions"
end
