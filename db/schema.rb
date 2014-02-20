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

ActiveRecord::Schema.define(:version => 20140220150110) do

  create_table "comments", :force => true do |t|
    t.integer  "author_id"
    t.integer  "recipient_id"
    t.text     "text"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "friendships", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "friend_id"
  end

  create_table "likes", :force => true do |t|
    t.integer  "liker_id"
    t.integer  "post_id"
    t.string   "post_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "message_threads", :force => true do |t|
    t.integer  "creator_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "author_id"
    t.text     "text"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "message_thread_id"
  end

  add_index "messages", ["message_thread_id"], :name => "index_messages_on_message_thread_id"

  create_table "pending_friendships", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "user_id"
    t.integer  "pending_friend_id"
  end

  create_table "photo_taggings", :force => true do |t|
    t.integer  "photo_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "url"
    t.integer  "uploader_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "photos", ["uploader_id"], :name => "index_photos_on_uploader_id"

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

  create_table "replies", :force => true do |t|
    t.integer  "author_id"
    t.text     "text"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "parent_id"
    t.string   "parent_type"
  end

  create_table "statuses", :force => true do |t|
    t.integer  "author_id"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_message_threads", :force => true do |t|
    t.integer  "message_thread_id"
    t.integer  "recipient_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

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
