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

ActiveRecord::Schema.define(version: 20160518140000) do

  create_table "health_attributes", force: :cascade do |t|
    t.integer  "user_id",                                          limit: 4
    t.boolean  "experiences_joint_pain"
    t.boolean  "feel_distressed"
    t.boolean  "disruptive_fatigue"
    t.boolean  "pain_limits_daily_activities"
    t.boolean  "troubled_by_constipation"
    t.boolean  "experiences_hot_flashes_or_night_sweats_daily"
    t.boolean  "has_trouble_sleeping"
    t.boolean  "experiences_loss_of_interest_in_daily_activities"
    t.boolean  "wants_to_harm_self_or_others"
    t.boolean  "feels_anxiety_frequently"
    t.boolean  "memory_problems_interfere_with_daily_life"
    t.boolean  "has_unexplained_weight_loss"
    t.boolean  "has_been_recommended_low_fiber_diet"
    t.boolean  "has_had_gall_bladder_removed"
    t.boolean  "has_difficulty_swallowing"
    t.boolean  "has_lymphedema"
    t.boolean  "experiences_increased_size_of_legs_or_abdomen"
    t.boolean  "has_lower_than_desired_sexual_desire"
    t.boolean  "intercourse_is_painful"
    t.boolean  "has_insufficient_social_support"
    t.boolean  "experiences_diarrhea"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "health_attributes", ["user_id"], name: "index_health_attributes_on_user_id", using: :btree

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

  add_foreign_key "health_attributes", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "responses", "surveys"
  add_foreign_key "responses", "users"
end
