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

ActiveRecord::Schema.define(version: 20171211183158) do

  create_table "enterprises", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inputs", force: :cascade do |t|
    t.integer "quantity"
    t.integer "item_id"
    t.integer "user_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_inputs_on_item_id"
    t.index ["user_id_id"], name: "index_inputs_on_user_id_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.string "description"
    t.integer "patrimony"
    t.integer "type_id"
    t.integer "sector_id"
    t.integer "quantity"
    t.integer "user_id"
    t.boolean "rent"
    t.integer "enterprise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enterprise_id"], name: "index_items_on_enterprise_id"
    t.index ["sector_id"], name: "index_items_on_sector_id"
    t.index ["type_id"], name: "index_items_on_type_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "outputs", force: :cascade do |t|
    t.integer "quantity"
    t.integer "item_id"
    t.integer "user_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_outputs_on_item_id"
    t.index ["user_id_id"], name: "index_outputs_on_user_id_id"
  end

  create_table "secretaries", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_secretaries_on_user_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "secretary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["secretary_id"], name: "index_sectors_on_secretary_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
