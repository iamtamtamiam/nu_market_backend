# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_19_015147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.string "item"
    t.text "description"
    t.integer "price"
    t.string "condition"
    t.string "status"
    t.integer "zipcode"
    t.text "contact"
    t.bigint "seller_id", null: false
    t.bigint "buyer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_listings_on_buyer_id"
    t.index ["seller_id"], name: "index_listings_on_seller_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "url"
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_photos_on_listing_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "phone"
    t.string "message"
    t.bigint "listing_id", null: false
    t.bigint "buyer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["buyer_id"], name: "index_requests_on_buyer_id"
    t.index ["listing_id"], name: "index_requests_on_listing_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "photos", "listings"
  add_foreign_key "requests", "listings"
end
