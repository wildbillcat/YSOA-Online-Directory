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

ActiveRecord::Schema.define(:version => 20110503135444) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "equip_agreements", :force => true do |t|
    t.boolean  "equip_agree"
    t.datetime "equip_agree_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "semester"
  end

  create_table "holidays", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "office_closed"
  end

  create_table "laser_agreements", :force => true do |t|
    t.boolean  "laser_agree"
    t.datetime "laser_agree_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "semester"
  end

  create_table "print_agreements", :force => true do |t|
    t.boolean  "print_agree"
    t.datetime "print_agree_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "semester"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.integer  "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "parent_id"
    t.integer  "portfolio_file_size"
    t.integer  "width"
    t.integer  "height"
    t.string   "portfolio_content_type", :limit => 50
    t.string   "portfolio_file_name",    :limit => 100
    t.string   "thumbnail"
    t.string   "collection"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "portfolio_updated_at"
    t.boolean  "portfolio_processing"
    t.string   "portfolio"
    t.string   "portfolio_owner_netid",  :limit => 10
  end

  create_table "transactions", :force => true do |t|
    t.string   "product_name"
    t.date     "checkout_date"
    t.date     "checkin_date"
    t.date     "due_date"
    t.integer  "days_late"
    t.string   "borrower_netid"
    t.integer  "student_id"
    t.integer  "product_id"
    t.text     "notes"
    t.string   "checkout_by"
    t.string   "checkin_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "extended_checkout"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "netid"
    t.string   "image_url"
    t.string   "email"
    t.integer  "class_year"
    t.string   "program"
    t.integer  "program_year"
    t.string   "undergrad_college"
    t.integer  "workstation_id"
    t.integer  "equip_agreement_id"
    t.integer  "print_agreement_id"
    t.integer  "laser_agreement_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.date     "graduation_date"
    t.string   "position"
    t.string   "dean_notes"
    t.string   "dm_notes"
    t.string   "submission_file_name"
    t.string   "submission_content_type"
    t.integer  "submission_file_size"
    t.datetime "submission_updated_at"
    t.string   "last_equip_agree_semester"
    t.string   "last_laser_agree_semester"
    t.string   "last_print_agree_semester"
    t.integer  "sid_number"
  end

  create_table "workstations", :force => true do |t|
    t.integer  "cpu_number"
    t.string   "monitor_number"
    t.string   "arm_number"
    t.text     "cpu_damage"
    t.text     "monitor_damage"
    t.text     "arm_damage"
    t.integer  "floor"
    t.string   "studio"
    t.datetime "registration_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "netid"
    t.string   "semester"
  end

end
