# This migration comes from shopping_cart (originally 20171009135344)
class CreateShoppingCartShippingMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_shipping_methods do |t|
      t.string   :name
      t.string   :duration
      t.decimal  :price, precision: 8, scale: 2
    end
  end
end
