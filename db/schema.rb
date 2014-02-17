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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140217203508) do

  create_table "friendships", :force => true do |t|
    t.integer  "first_friend_id"
    t.integer  "second_friend_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "pending_friendships", :force => true do |t|
    t.integer  "first_friend_id"
    t.integer  "second_friend_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "first_name",          :null => false
    t.string   "last_name",           :null => false
    t.string   "birth_month"
    t.string   "birth_day"
    t.string   "birth_year"
    t.string   "gender"
    t.string   "job"
    t.string   "employer"
    t.string   "current_city"
    t.string   "home_city"
    t.string   "relationship_status"
    t.string   "interested_in"
    t.text     "about_me"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "owner_id"
    t.string   "photo_url"
  end

  add_index "profiles", ["owner_id"], :name => "index_profiles_on_owner_id"

  create_table "users", :force => true do |t|
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "session_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["session_token"], :name => "index_users_on_session_token"

end
