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

ActiveRecord::Schema.define(version: 2022_06_14_195849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "subscription_id", null: false
    t.string "buy_order"
    t.string "token"
    t.decimal "amount"
    t.integer "status"
    t.string "card_number"
    t.datetime "transaction_date"
    t.integer "payment_type_code"
    t.decimal "installments_amount"
    t.integer "installments_number"
    t.decimal "balance"
    t.string "authorization_code"
    t.datetime "authorization_date"
    t.decimal "nullified_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subscription_id"], name: "index_orders_on_subscription_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products_subscriptions", id: false, force: :cascade do |t|
    t.bigint "subscription_id", null: false
    t.bigint "product_id", null: false
    t.index ["product_id"], name: "index_products_subscriptions_on_product_id"
    t.index ["subscription_id"], name: "index_products_subscriptions_on_subscription_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "total_amount"
    t.boolean "is_active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.integer "gender"
    t.datetime "date_of_birth"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "orders", "subscriptions"
  add_foreign_key "orders", "users"
end
