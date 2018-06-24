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

ActiveRecord::Schema.define(:version => 20180624095654) do

  create_table "books", :force => true do |t|
    t.integer  "subject_id",                :null => false
    t.string   "title",       :limit => 32, :null => false
    t.float    "price",                     :null => false
    t.text     "description",               :null => false
    t.datetime "created_at",                :null => false
    t.integer  "user_id"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.boolean  "public"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "forums_users", :force => true do |t|
    t.integer "forum_id"
    t.integer "user_id"
  end

  create_table "labs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :id => false, :force => true do |t|
    t.integer "role_id"
    t.string  "role_type"
  end

  create_table "roleusers", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "roles_id"
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students_teachers", :force => true do |t|
    t.integer "teacher_id"
    t.integer "student_id"
  end

  add_index "students_teachers", ["student_id"], :name => "index_students_teachers_on_student_id"
  add_index "students_teachers", ["teacher_id"], :name => "index_students_teachers_on_teacher_id"

  create_table "subjects", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "teachers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teaching_assistants", :force => true do |t|
    t.string   "name"
    t.integer  "ta_duty_id"
    t.string   "ta_duty_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "user_subjects", :force => true do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
