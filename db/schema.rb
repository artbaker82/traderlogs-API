# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_19_150114) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "trade_instances", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "trading_system_id"
    t.string "title"
    t.string "security", null: false
    t.datetime "buy_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "sell_date"
    t.float "buy_price", null: false
    t.float "sell_price"
    t.float "num_shares"
    t.float "r"
    t.decimal "r_multiple"
    t.text "reflection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trading_system_id"], name: "index_trade_instances_on_trading_system_id"
  end

  create_table "trading_systems", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.float "expectancy", default: 0.0, null: false
    t.float "reliability", default: 0.0, null: false
    t.integer "opportunity_month", default: 0, null: false
    t.float "cost_per_trade", default: 0.0, null: false
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.text "description"
    t.index ["user_id"], name: "index_trading_systems_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "trade_instances", "trading_systems"
  add_foreign_key "trading_systems", "users"
end
