class InitializeDatabase < ActiveRecord::Migration[8.0]
  def change
    create_table "users", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "role", default: "customer"
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.string "confirmation_token"
      t.datetime "confirmed_at"
      t.datetime "confirmation_sent_at"
      t.string "unconfirmed_email"
      t.timestamps precision: 6, null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token, unique: true

    create_table "categories", force: :cascade do |t|
      t.string "name"
      t.timestamps precision: 6, null: false
    end

    create_table "products", force: :cascade do |t|
      t.string "name"
      t.text "description"
      t.decimal "price", precision: 10, scale: 2
      t.integer "stock_quantity"
      t.bigint "category_id", null: false
      t.timestamps precision: 6, null: false
    end

    add_index :products, :category_id
    add_foreign_key :products, :categories

    create_table "orders", force: :cascade do |t|
      t.bigint "user_id", null: false
      t.string "status", default: "pending"
      t.decimal "total_price", precision: 10, scale: 2
      t.timestamps precision: 6, null: false
    end

    add_index :orders, :user_id
    add_foreign_key :orders, :users

    create_table "order_items", force: :cascade do |t|
      t.bigint "order_id", null: false
      t.bigint "product_id", null: false
      t.integer "quantity"
      t.decimal "price", precision: 10, scale: 2
      t.timestamps precision: 6, null: false
    end

    add_index :order_items, :order_id
    add_index :order_items, :product_id
    add_foreign_key :order_items, :orders
    add_foreign_key :order_items, :products

    create_table "carts", force: :cascade do |t|
      t.bigint "user_id"
      t.string "session_id"
      t.timestamps precision: 6, null: false
    end

    add_index :carts, :user_id
    add_foreign_key :carts, :users

    create_table "cart_items", force: :cascade do |t|
      t.bigint "cart_id", null: false
      t.bigint "product_id", null: false
      t.integer "quantity"
      t.timestamps precision: 6, null: false
    end

    add_index :cart_items, :cart_id
    add_index :cart_items, :product_id
    add_foreign_key :cart_items, :carts
    add_foreign_key :cart_items, :products

    create_table "notifications", force: :cascade do |t|
      t.bigint "user_id", null: false
      t.text "message"
      t.boolean "read", default: false
      t.timestamps precision: 6, null: false
    end

    add_index :notifications, :user_id
    add_foreign_key :notifications, :users
  end
end
