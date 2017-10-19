# This migration comes from shopping_cart (originally 20171009144955)
class CreateShoppingCartShippingAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_shipping_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :zip
      t.string :phone
      t.belongs_to :user, foreign_key: true
      t.belongs_to :country, foreign_key: { to_table: :shopping_cart_countries }
      t.belongs_to :order, foreign_key: { to_table: :shopping_cart_orders }
      t.timestamps
    end
  end
end
