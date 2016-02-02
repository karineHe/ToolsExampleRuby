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

ActiveRecord::Schema.define(version: 20160202103721) do

  create_table "assignments", force: :cascade do |t|
    t.integer "facture_id"
    t.integer "ref_id"
    t.integer "qty"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "civ"
    t.string   "lname"
    t.string   "fname"
    t.string   "job"
    t.text     "address"
    t.string   "email"
    t.string   "phone"
    t.string   "cell"
    t.string   "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
  end

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factures", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
    t.integer  "client_id"
    t.text     "emetteur"
    t.integer  "contact_id"
    t.integer  "company_id"
    t.text     "objet"
  end

  create_table "refs", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.float    "pu_ht"
    t.float    "tva"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_networks", force: :cascade do |t|
    t.string   "twitter"
    t.string   "facebook"
    t.string   "linkedIn"
    t.string   "viadeo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
