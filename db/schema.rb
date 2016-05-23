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

ActiveRecord::Schema.define(version: 20160522060000) do

  create_table "email_messages", force: :cascade do |t|
    t.integer  "tenant_id",  limit: 4
    t.string   "from",       limit: 255
    t.string   "to",         limit: 255
    t.string   "cc",         limit: 255
    t.string   "bcc",        limit: 255
    t.string   "subject",    limit: 255
    t.string   "body",       limit: 255
    t.string   "kind",       limit: 255
    t.string   "state",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "email_templates", force: :cascade do |t|
    t.integer  "tenant_id",  limit: 4
    t.string   "name",       limit: 255
    t.string   "kind",       limit: 255
    t.string   "state",      limit: 255
    t.string   "to",         limit: 255
    t.string   "from",       limit: 255
    t.string   "cc",         limit: 255
    t.string   "bcc",        limit: 255
    t.string   "subject",    limit: 255
    t.string   "body",       limit: 255
    t.boolean  "is_default"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "health_attributes", force: :cascade do |t|
    t.integer  "tenant_id",   limit: 4
    t.string   "name",        limit: 255
    t.string   "sequence",    limit: 255
    t.boolean  "is_filter"
    t.boolean  "notify"
    t.string   "notify_text", limit: 255
    t.string   "recipients",  limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "subject_id", limit: 4
    t.string   "kind",       limit: 255
    t.string   "state",      limit: 255
    t.string   "content",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",                          limit: 4
    t.string   "first_name",                       limit: 255
    t.string   "last_name",                        limit: 255
    t.string   "age",                              limit: 255
    t.string   "cancer_type",                      limit: 255
    t.integer  "sex",                              limit: 4
    t.string   "time_since_diagnosis",             limit: 255
    t.boolean  "received_chemotherapy"
    t.boolean  "received_radiation_therapy"
    t.boolean  "active_cancer"
    t.boolean  "metastatic_cancer"
    t.boolean  "receiving_cancer_treatment"
    t.boolean  "has_kidney_disease"
    t.boolean  "has_liver_disease"
    t.boolean  "has_congestive_heart_failure"
    t.boolean  "has_atrial_fibrillation"
    t.boolean  "has_dementia"
    t.boolean  "cannot_maintain_balance"
    t.boolean  "has_diabetes"
    t.boolean  "increased_bowel_obstruction_risk"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "responses", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "survey_id",       limit: 4
    t.text     "response_record", limit: 65535, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "responses", ["survey_id"], name: "index_responses_on_survey_id", using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "surveys", force: :cascade do |t|
    t.text     "schema",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user_health_attributes", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.string   "health_attribute_id", limit: 255
    t.boolean  "answer"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                      limit: 255, default: "", null: false
    t.string   "encrypted_password",         limit: 255, default: "", null: false
    t.string   "reset_password_token",       limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",         limit: 255
    t.string   "last_sign_in_ip",            limit: 255
    t.boolean  "terms_of_service_agreement"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "profiles", "users"
  add_foreign_key "responses", "surveys"
  add_foreign_key "responses", "users"
end
