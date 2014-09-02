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

ActiveRecord::Schema.define(version: 20140902034156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: true do |t|
    t.datetime "appointment_date"
    t.integer  "practitioner_id"
    t.integer  "patient_id"
    t.boolean  "taken"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultations", force: true do |t|
    t.text     "initial_consultation_note"
    t.integer  "appointment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.string   "title"
    t.string   "f_name"
    t.string   "m_name"
    t.string   "l_name"
    t.string   "address"
    t.string   "postcode"
    t.string   "phone"
    t.string   "mobile"
    t.date     "dob"
    t.string   "occupation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "practitioners", force: true do |t|
    t.string  "name"
    t.string  "phone"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "is_admin",        default: false
  end

  create_table "prescription_supplements", force: true do |t|
    t.integer  "qty"
    t.integer  "prescription_id"
    t.integer  "supplement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prescriptions", force: true do |t|
    t.text     "recommendation"
    t.text     "dosage"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supplements", force: true do |t|
    t.string   "item_name"
    t.float    "package_amount"
    t.float    "item_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
