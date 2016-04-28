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

ActiveRecord::Schema.define(version: 20160427093750) do

  create_table "agencies", force: :cascade do |t|
    t.string   "type_of",      limit: 255
    t.string   "name",         limit: 255
    t.string   "dba",          limit: 255
    t.string   "display_name", limit: 255
    t.string   "address1",     limit: 255
    t.string   "address2",     limit: 255
    t.string   "zip",          limit: 255
    t.string   "email",        limit: 255
    t.string   "phone",        limit: 255
    t.string   "fax",          limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "indications", force: :cascade do |t|
    t.integer  "underwriter_id",            limit: 4
    t.string   "state",                     limit: 255
    t.date     "effective_date"
    t.date     "expire_date"
    t.integer  "wholesale_agency_id",       limit: 4
    t.integer  "retail_agency_id",          limit: 4
    t.integer  "placement_fee",             limit: 4
    t.integer  "employee_payroll",          limit: 4
    t.integer  "owner_payroll",             limit: 4
    t.integer  "total_payroll",             limit: 4
    t.boolean  "sub_out_commercial"
    t.boolean  "sub_out_residential"
    t.integer  "gross_receipts_current",    limit: 4
    t.string   "description_of_operations", limit: 255
    t.string   "type_of_contractor",        limit: 255
    t.string   "type_al_requested",         limit: 255
    t.string   "limits_selected",           limit: 255
    t.string   "insured_ops",               limit: 255
    t.string   "limits",                    limit: 255
    t.string   "rating_factor",             limit: 255
    t.string   "dba",                       limit: 255
    t.string   "name",                      limit: 255
    t.string   "zip",                       limit: 255
    t.string   "address1",                  limit: 255
    t.string   "address2",                  limit: 255
    t.string   "city",                      limit: 255
    t.string   "email",                     limit: 255
    t.string   "fax",                       limit: 255
    t.string   "phone",                     limit: 255
    t.string   "state_code",                limit: 255
    t.string   "gf_comments",               limit: 255
    t.string   "approval_comments",         limit: 255
    t.string   "pdf_natural_url",           limit: 255
    t.string   "pdf_tracking_url",          limit: 255
    t.integer  "mgu_id",                    limit: 4
    t.decimal  "total_policy_cost",                     precision: 8, scale: 2
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  create_table "policies", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "state",            limit: 255
    t.string   "number",           limit: 255
    t.string   "dba",              limit: 255
    t.string   "phone",            limit: 255
    t.string   "email",            limit: 255
    t.integer  "wholesale_id",     limit: 4
    t.integer  "wholesale_rep_id", limit: 4
    t.integer  "retail_id",        limit: 4
    t.integer  "retail_rep_id",    limit: 4
    t.integer  "uw_id",            limit: 4
    t.integer  "mgu_id",           limit: 4
    t.integer  "program_id",       limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string   "user_id",        limit: 255
    t.string   "first_name",     limit: 255
    t.string   "last_name",      limit: 255
    t.string   "phone_number",   limit: 255
    t.string   "facebook_user",  limit: 255
    t.string   "twitter_handle", limit: 255
    t.string   "address_1",      limit: 255
    t.string   "address_2",      limit: 255
    t.string   "city",           limit: 255
    t.string   "state",          limit: 255
    t.string   "postal_code",    limit: 255
    t.string   "mobile_number",  limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
