ActiveRecord::Schema.define(version: 2022_04_19_105157) do

  create_table "foods", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.string "name", null: false
    t.integer "price", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_foods_on_restaurant_id"
  end

  create_table "line_foods", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "food_id", null: false
    t.bigint "restaurant_id", null: false
    t.bigint "order_id"
    t.integer "count", default: 0, null: false
    t.boolean "active", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_line_foods_on_food_id"
    t.index ["order_id"], name: "index_line_foods_on_order_id"
    t.index ["restaurant_id"], name: "index_line_foods_on_restaurant_id"
  end

  create_table "orders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "total_price", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restaurants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "fee", default: 0, null: false
    t.integer "time_required", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "foods", "restaurants"
  add_foreign_key "line_foods", "foods"
  add_foreign_key "line_foods", "orders"
  add_foreign_key "line_foods", "restaurants"
end
