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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120120213000) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizations", :force => true do |t|
    t.integer  "category_id"
    t.integer  "cbo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["category_id"], :name => "index_categorizations_on_category_id"
  add_index "categorizations", ["cbo_id"], :name => "index_categorizations_on_cbo_id"

  create_table "cbo_community_memberships", :force => true do |t|
    t.integer  "cbo_id"
    t.integer  "community_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cbo_community_memberships", ["cbo_id", "community_id"], :name => "index_cbo_community_memberships_on_cbo_id_and_community_id", :unique => true
  add_index "cbo_community_memberships", ["cbo_id"], :name => "index_cbo_community_memberships_on_cbo_id"
  add_index "cbo_community_memberships", ["community_id"], :name => "index_cbo_community_memberships_on_community_id"

  create_table "cboprofiles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "cbo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street1",          :default => ""
    t.string   "street2",          :default => ""
    t.string   "city",             :default => ""
    t.string   "state",            :default => ""
    t.string   "zip",              :default => ""
    t.string   "country",          :default => ""
    t.text     "information"
    t.text     "location_notes"
    t.text     "how_to_volunteer"
  end

  add_index "cboprofiles", ["cbo_id"], :name => "index_cboprofiles_on_cbo_id"

  create_table "cbos", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.integer  "confirmed",          :default => 0
  end

  add_index "cbos", ["email"], :name => "index_cbos_on_email", :unique => true

  create_table "communities", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zip"
  end

  add_index "communities", ["city"], :name => "index_communities_on_city"
  add_index "communities", ["name"], :name => "index_communities_on_name"
  add_index "communities", ["state"], :name => "index_communities_on_state"

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cbo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "confirmed",  :default => 0
  end

  add_index "memberships", ["cbo_id"], :name => "index_memberships_on_cbo_id"
  add_index "memberships", ["user_id"], :name => "index_memberships_on_user_id"

  create_table "opportunities", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "cbo_id"
    t.integer  "questionnaire_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "information"
  end

  add_index "opportunities", ["cbo_id"], :name => "index_opportunities_on_cbo_id"

  create_table "participations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "opportunity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "confirmed",      :default => 0
  end

  add_index "participations", ["opportunity_id"], :name => "index_participations_on_cbo_id"
  add_index "participations", ["user_id"], :name => "index_participations_on_student_id"

  create_table "user_community_memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "community_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_community_memberships", ["community_id"], :name => "index_user_community_memberships_on_community_id"
  add_index "user_community_memberships", ["user_id", "community_id"], :name => "index_user_community_memberships_on_user_id_and_community_id", :unique => true
  add_index "user_community_memberships", ["user_id"], :name => "index_user_community_memberships_on_user_id"

  create_table "userprofiles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "nickname"
    t.integer  "user_id"
    t.string   "street1",            :default => ""
    t.string   "street2",            :default => ""
    t.string   "city",               :default => ""
    t.string   "state",              :default => ""
    t.string   "zip",                :default => ""
    t.string   "country",            :default => ""
    t.float    "latitude"
    t.float    "longitude"
    t.text     "short_bio"
    t.text     "long_bio"
    t.text     "question1_response"
    t.text     "question2_response"
    t.text     "question3_response"
    t.text     "question4_response"
  end

  add_index "userprofiles", ["user_id"], :name => "index_userprofiles_on_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "student",                :default => true
    t.boolean  "admin",                  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.integer  "confirmed",              :default => 0
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "remember_token"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
