# This migration comes from shopping_cart (originally 20171004123350)
class CreateShoppingCartOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_orders do |t|
      t.string :number
      t.bigint :user_id
      t.decimal :total_price, precision: 8, scale: 2
      t.timestamps
    end
  end
end
