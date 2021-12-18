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

ActiveRecord::Schema.define(version: 2021_12_16_025735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities_routes", id: false, force: :cascade do |t|
    t.bigint "city_id", null: false
    t.bigint "route_id", null: false
    t.index ["city_id", "route_id"], name: "index_cities_routes_on_city_id_and_route_id", unique: true
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.float "distance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "identifier", null: false
    t.integer "current_location", default: 0
    t.float "distance_traveled", default: 0.0
    t.float "fuel_consumption", default: 0.0
    t.float "fuel_consumed", default: 0.0
    t.boolean "is_available", default: false
    t.bigint "city_id"
    t.bigint "route_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_vehicles_on_city_id"
    t.index ["route_id"], name: "index_vehicles_on_route_id"
  end

end
