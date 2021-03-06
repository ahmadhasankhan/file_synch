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

ActiveRecord::Schema.define(version: 20160308130843) do

  create_table "contacts", force: :cascade do |t|
    t.string   "full_name",    limit: 255
    t.string   "email",        limit: 255
    t.integer  "phone_number", limit: 4
    t.text     "address",      limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "folders", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "parent_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", limit: 4
    t.integer "user_id",  limit: 4
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "folder_id",  limit: 4
    t.integer "group_id",   limit: 4
    t.boolean "can_create"
    t.boolean "can_read"
    t.boolean "can_update"
    t.boolean "can_delete"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.float    "price",      limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "share_links", force: :cascade do |t|
    t.string   "emails",          limit: 255
    t.string   "link_token",      limit: 255
    t.datetime "link_expires_at"
    t.integer  "user_file_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "message",         limit: 65535
    t.integer  "user_id",         limit: 4
  end

  create_table "user_files", force: :cascade do |t|
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size",    limit: 4
    t.datetime "attachment_updated_at"
    t.integer  "folder_id",               limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                            limit: 255
    t.string   "email",                           limit: 255
    t.string   "hashed_password",                 limit: 255
    t.string   "password_salt",                   limit: 255
    t.boolean  "is_admin"
    t.string   "remember_token",                  limit: 255
    t.string   "reset_password_token",            limit: 255
    t.datetime "reset_password_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "signup_token",                    limit: 255
    t.datetime "signup_token_expires_at"
  end

  add_index "users", ["signup_token"], name: "index_users_on_signup_token", using: :btree

end
