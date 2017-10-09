# This migration comes from shopping_cart (originally 20171004135550)
class CreateShoppingCartOrderStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_order_statuses do |t|
      t.string :name
      t.belongs_to :orders, foreign_key: { to_table: :shopping_cart_orders }
    end
  end
end
