# This migration comes from shopping_cart (originally 20171004135344)
class CreateShoppingCartShippingMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_shipping_methods do |t|
      t.string   :name
      t.string   :duration
      t.decimal  :price, precision: 8, scale: 2
      t.belongs_to :orders, foreign_key: { to_table: :shopping_cart_orders }
    end
  end
end
