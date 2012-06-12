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

ActiveRecord::Schema.define(:version => 20120612025851) do

  create_table "builds", :force => true do |t|
    t.integer  "contract_id"
    t.text     "saved_state"
    t.string   "hourly_rate"
    t.string   "cms_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "contract_additionals", :force => true do |t|
    t.string   "follow_up"
    t.string   "next_step"
    t.integer  "contract_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "contracts", :force => true do |t|
    t.string   "company"
    t.string   "address"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "url"
    t.string   "contract_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "modification_pages", :force => true do |t|
    t.string   "name"
    t.string   "hours"
    t.string   "cost"
    t.text     "description",  :limit => 255
    t.string   "cms_type"
    t.string   "feature_type"
    t.integer  "build_id"
    t.integer  "template_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "modifications", :force => true do |t|
    t.integer  "build_id"
    t.string   "page_type"
    t.string   "name"
    t.string   "hours"
    t.integer  "template_id"
    t.text     "description", :limit => 255
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "professional_pages", :force => true do |t|
    t.string   "name"
    t.string   "hours"
    t.string   "cost"
    t.string   "cms_type"
    t.string   "feature_type"
    t.text     "description",  :limit => 255
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "professional_templates", :force => true do |t|
    t.string   "name"
    t.string   "hours"
    t.string   "page_type"
    t.text     "description", :limit => 255
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "professionals", :force => true do |t|
    t.string   "company"
    t.string   "address"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "url"
    t.string   "contract_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
