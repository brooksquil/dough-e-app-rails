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

ActiveRecord::Schema.define(version: 20171226203921) do

  create_table "companies", force: :cascade do |t|
    t.text "company_name"
    t.text "shipping_address"
    t.text "shipping_address_2"
    t.text "shipping_city"
    t.text "shipping_state"
    t.string "shipping_zipcode"
    t.text "shipping_notes"
    t.text "billing_street_address"
    t.text "billing_address_2"
    t.text "billing_state"
    t.text "billing_zipcode"
    t.text "company_phone"
    t.text "email"
    t.text "payment_terms"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "quantity"
    t.integer "order_id"
    t.integer "product_id"
    t.integer "standing_order_id"
    t.integer "quantity_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
    t.index ["quantity_type_id"], name: "index_order_products_on_quantity_type_id"
    t.index ["standing_order_id"], name: "index_order_products_on_standing_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.date "delivery_date"
    t.boolean "open"
    t.integer "company_id"
    t.integer "user_id"
    t.integer "payment_type_id"
    t.index ["company_id"], name: "index_orders_on_company_id"
    t.index ["payment_type_id"], name: "index_orders_on_payment_type_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_types", force: :cascade do |t|
    t.text "payment_type"
    t.text "account_number"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_payment_types_on_company_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.float "price"
    t.boolean "is_active"
    t.integer "product_type_id"
    t.integer "quantity_type_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
    t.index ["quantity_type_id"], name: "index_products_on_quantity_type_id"
  end

  create_table "quantity_types", force: :cascade do |t|
    t.text "name"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standing_orders", force: :cascade do |t|
    t.text "week_day"
    t.integer "quantity"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "title"
    t.text "email"
    t.text "password_digest"
    t.text "work_phone"
    t.text "mobile_phone"
    t.boolean "is_active"
    t.boolean "admin"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
  end

end
