# This migration comes from shopping_cart (originally 20171009143350)
class CreateShoppingCartOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_orders do |t|
      t.string :number
      t.decimal :total_price, precision: 8, scale: 2
      t.timestamps
      t.references :shipping_method, foreign_key: { to_table: :shopping_cart_shipping_methods }
      t.references :coupon, foreign_key: { to_table: :shopping_cart_coupons }
      t.references :order_status, foreign_key: { to_table: :shopping_cart_order_statuses }
      t.references :user, foreign_key: { to_table: ShoppingCart.user_class.to_s.downcase.pluralize.to_sym }
    end
  end
end
