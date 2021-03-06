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

ActiveRecord::Schema.define(version: 20170508112122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fabric_families", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fabric_pictures", force: :cascade do |t|
    t.integer  "fabric_id"
    t.boolean  "activated",  default: true
    t.boolean  "main",       default: false
    t.boolean  "preview",    default: false
    t.text     "image"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["fabric_id"], name: "index_fabric_pictures_on_fabric_id", using: :btree
  end

  create_table "fabric_prices", force: :cascade do |t|
    t.string   "title"
    t.integer  "product_family_id"
    t.integer  "fabric_family_id"
    t.decimal  "price_std",         precision: 8, scale: 2
    t.decimal  "price_big",         precision: 8, scale: 2
    t.integer  "price_unit_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["fabric_family_id"], name: "index_fabric_prices_on_fabric_family_id", using: :btree
    t.index ["price_unit_id"], name: "index_fabric_prices_on_price_unit_id", using: :btree
    t.index ["product_family_id"], name: "index_fabric_prices_on_product_family_id", using: :btree
  end

  create_table "fabrics", force: :cascade do |t|
    t.string   "serial"
    t.string   "kind",             default: "fabric"
    t.string   "title"
    t.integer  "fabric_family_id"
    t.boolean  "activated",        default: false
    t.string   "origin"
    t.string   "content"
    t.text     "description"
    t.float    "stock_length"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "slug"
    t.index ["fabric_family_id"], name: "index_fabrics_on_fabric_family_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "measures", force: :cascade do |t|
    t.string   "title"
    t.boolean  "around_collar_large",        default: false
    t.boolean  "shoulder_width",             default: false
    t.boolean  "shoulder_waist_front_large", default: false
    t.boolean  "shoulder_waist_back_large",  default: false
    t.boolean  "back_width",                 default: false
    t.boolean  "chest_width",                default: false
    t.boolean  "around_bust_large",          default: false
    t.boolean  "bust_height",                default: false
    t.boolean  "around_waist_large",         default: false
    t.boolean  "elbow_length",               default: false
    t.boolean  "around_arm_large",           default: false
    t.boolean  "arm_lenght",                 default: false
    t.boolean  "around_hip_height",          default: false
    t.boolean  "around_hip_large",           default: false
    t.boolean  "half_hip_height",            default: false
    t.boolean  "crotch_length",              default: false
    t.boolean  "knee_lenght",                default: false
    t.boolean  "leg_length",                 default: false
    t.boolean  "inside_leg_length",          default: false
    t.boolean  "around_leg_large",           default: false
    t.boolean  "total_height",               default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "zipcode"
    t.string   "email"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_lines", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "fabric_id"
    t.boolean  "std_size",                                  default: true
    t.boolean  "sep_fabric",                                default: true
    t.decimal  "confection_price", precision: 12, scale: 3, default: "0.0"
    t.decimal  "fabric_price",     precision: 12, scale: 3, default: "0.0"
    t.decimal  "unit_price",       precision: 12, scale: 3, default: "0.0"
    t.integer  "quantity",                                  default: 1
    t.decimal  "total_price",      precision: 12, scale: 3, default: "0.0"
    t.integer  "price_unit_id"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.index ["fabric_id"], name: "index_order_lines_on_fabric_id", using: :btree
    t.index ["order_id"], name: "index_order_lines_on_order_id", using: :btree
    t.index ["price_unit_id"], name: "index_order_lines_on_price_unit_id", using: :btree
    t.index ["product_id"], name: "index_order_lines_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "serial"
    t.string   "status"
    t.string   "delivery_method"
    t.string   "title"
    t.string   "name"
    t.string   "surname"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "country"
    t.string   "phone"
    t.decimal  "subtotal",          precision: 12, scale: 3, default: "0.0"
    t.decimal  "shipping_fees",     precision: 12, scale: 3, default: "0.0"
    t.decimal  "tax_fees",          precision: 12, scale: 3, default: "0.0"
    t.decimal  "share_discount",                             default: "0.0"
    t.decimal  "num_discount",      precision: 12, scale: 3, default: "0.0"
    t.decimal  "total",             precision: 12, scale: 3, default: "0.0"
    t.integer  "price_unit_id"
    t.string   "payment_method"
    t.string   "payment_type"
    t.string   "payment_status"
    t.datetime "creation_date"
    t.datetime "validation_date"
    t.datetime "confirmation_date"
    t.datetime "expedition_date"
    t.datetime "payment_date"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.index ["price_unit_id"], name: "index_orders_on_price_unit_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "price_units", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_families", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_pictures", force: :cascade do |t|
    t.integer "product_id"
    t.boolean "main",       default: false
    t.boolean "activated",  default: true
    t.text    "image"
    t.index ["product_id"], name: "index_product_pictures_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "serial"
    t.string   "title"
    t.boolean  "activated",                                 default: false
    t.integer  "kind",                                      default: 1
    t.integer  "customer_id"
    t.integer  "product_family_id"
    t.integer  "measure_id"
    t.text     "description"
    t.decimal  "confection_price",  precision: 8, scale: 2
    t.integer  "price_unit_id"
    t.string   "leadtime"
    t.boolean  "custom_fabric",                             default: true
    t.boolean  "on_measure",                                default: true
    t.boolean  "unic_size",                                 default: true
    t.float    "fabric_lng_std"
    t.float    "fabric_lrg_std"
    t.float    "fabric_lng_big"
    t.float    "fabric_lrg_big"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.string   "slug"
    t.index ["customer_id"], name: "index_products_on_customer_id", using: :btree
    t.index ["measure_id"], name: "index_products_on_measure_id", using: :btree
    t.index ["price_unit_id"], name: "index_products_on_price_unit_id", using: :btree
    t.index ["product_family_id"], name: "index_products_on_product_family_id", using: :btree
    t.index ["slug"], name: "index_products_on_slug", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "zipcode"
    t.boolean  "newsletter",             default: false
    t.integer  "country_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["country_id"], name: "index_users_on_country_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "fabric_pictures", "fabrics"
  add_foreign_key "fabric_prices", "fabric_families"
  add_foreign_key "fabric_prices", "product_families"
  add_foreign_key "fabrics", "fabric_families"
  add_foreign_key "order_lines", "fabrics"
  add_foreign_key "order_lines", "orders"
  add_foreign_key "order_lines", "products"
  add_foreign_key "product_pictures", "products"
  add_foreign_key "products", "product_families"
end
