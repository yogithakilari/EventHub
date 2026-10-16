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

ActiveRecord::Schema[7.1].define(version: 2026_10_16_075637) do
  create_table "booking_items", force: :cascade do |t|
    t.integer "seats_booked"
    t.decimal "price"
    t.integer "booking_id", null: false
    t.integer "ticket_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_items_on_booking_id"
    t.index ["ticket_type_id"], name: "index_booking_items_on_ticket_type_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "ticket_quantity"
    t.decimal "amount_paid"
    t.decimal "discount"
    t.string "booking_status"
    t.string "booking_reference"
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_bookings_on_event_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discount_codes", force: :cascade do |t|
    t.string "code"
    t.integer "discount_percentage"
    t.datetime "expiry"
    t.integer "max_uses"
    t.boolean "is_active"
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_discount_codes_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "venue_name"
    t.string "city"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "status"
    t.integer "age_limit"
    t.boolean "pet_friendly"
    t.integer "user_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "ticket_types", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "seats"
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_ticket_types_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "role"
    t.string "phone_number"
    t.integer "age"
    t.boolean "is_active"
    t.string "approval_status"
    t.text "rejection_reason"
    t.string "profile_photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "booking_items", "bookings"
  add_foreign_key "booking_items", "ticket_types"
  add_foreign_key "bookings", "events"
  add_foreign_key "bookings", "users"
  add_foreign_key "discount_codes", "events"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "users"
  add_foreign_key "ticket_types", "events"
end
