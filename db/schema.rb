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

ActiveRecord::Schema.define(:version => 20120207174508) do

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "report"
    t.datetime "created_at",   :default => '2012-02-18 14:35:18'
    t.datetime "scheduled_at"
  end

  create_table "people", :force => true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "e_mail"
  end

  create_table "submissions", :force => true do |t|
    t.integer "person_id"
    t.integer "event_id"
  end

  create_table "submits", :force => true do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
  end

  create_table "talks", :force => true do |t|
    t.integer "person_id"
    t.integer "event_id"
    t.string  "title"
    t.text    "body"
  end

end
