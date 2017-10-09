# This migration comes from shopping_cart (originally 20171004135116)
class CreateShoppingCartBillingAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_billing_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :zip
      t.string :phone
      t.belongs_to :user, foreign_key: true
      t.belongs_to :country, foreign_key: true
      t.belongs_to :orders, foreign_key: { to_table: :shopping_cart_orders }
      t.timestamps
    end
  end
end
