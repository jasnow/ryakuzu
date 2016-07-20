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

ActiveRecord::Schema.define(version: 20151014004636) do

  create_table "authorizations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authorizations_on_user_id"
  end

  create_table "bags", force: :cascade do |t|
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_bags_on_team_id"
  end

  create_table "enemies", force: :cascade do |t|
    t.integer  "health"
    t.integer  "magic"
    t.integer  "attack"
    t.integer  "exp"
    t.boolean  "move",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "type",       default: ""
    t.integer  "user_id"
    t.string   "img_url",    default: ""
    t.integer  "coins"
    t.index ["user_id"], name: "index_enemies_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "item_params"
    t.integer  "itemable_id"
    t.string   "itemable_type"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "used",          default: false
    t.index ["itemable_type", "itemable_id"], name: "index_items_on_itemable_type_and_itemable_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.string   "name",            limit: 150, default: ""
    t.integer  "health",                      default: 500
    t.integer  "magic",                       default: 250
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "img_link",                    default: ""
    t.integer  "attack",                      default: 30
    t.integer  "exp",                         default: 0
    t.integer  "level",                       default: 0
    t.integer  "previous_health"
    t.integer  "previous_magic"
    t.boolean  "armed",                       default: false
    t.integer  "item_id"
    t.index ["item_id"], name: "index_monsters_on_item_id"
    t.index ["name"], name: "index_monsters_on_name"
    t.index ["team_id"], name: "index_monsters_on_team_id"
    t.index ["user_id"], name: "index_monsters_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",           limit: 150, default: ""
    t.integer  "level",                      default: 0
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "monsters_count",             default: 0
    t.integer  "monsters_limit"
    t.integer  "exp",                        default: 0
    t.boolean  "move",                       default: true
    t.integer  "to_next_level"
    t.index ["name"], name: "index_teams_on_name"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.integer  "current_sign_in_ip"
    t.integer  "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "coins",                  default: 5000
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
