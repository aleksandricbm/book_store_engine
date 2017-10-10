# This migration comes from shopping_cart (originally 20171009135550)
class CreateShoppingCartOrderStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_order_statuses do |t|
      t.string :name
    end
  end
end
