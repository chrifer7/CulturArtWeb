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

ActiveRecord::Schema.define(:version => 20140607010704) do

  create_table "content_attribute_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "deleted"
  end

  create_table "content_attribute_values", :force => true do |t|
    t.integer  "attribute_id"
    t.string   "name"
    t.text     "description"
    t.string   "icon"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "deleted"
  end

  create_table "content_attributes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "attribute_type_id"
    t.integer  "data_type_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "deleted"
  end

  create_table "content_data_types", :force => true do |t|
    t.string   "name"
    t.string   "ptype"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "deleted"
  end

  create_table "content_document_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "icon"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "content_documents", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "content_heritages", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "brief_history"
    t.float    "extention"
    t.float    "lat"
    t.float    "lon"
    t.float    "alt"
    t.float    "perimeter"
    t.text     "geo_location"
    t.text     "access_routes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "deleted"
  end

  create_table "content_heritages_content_attributes", :id => false, :force => true do |t|
    t.integer "content_heritage_id"
    t.integer "content_attribute_id"
  end

  create_table "content_overlayed_imgs", :force => true do |t|
    t.string   "name"
    t.text     "history"
    t.string   "url"
    t.float    "lat_img"
    t.float    "lon_img"
    t.float    "alt_img"
    t.float    "lat_user"
    t.float    "lon_user"
    t.float    "alt_user"
    t.integer  "heritage_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "deleted"
  end

end
