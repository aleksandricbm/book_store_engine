# This migration comes from shopping_cart (originally 20171009143755)
class CreateShoppingCartOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_order_items do |t|
      t.integer :quantity
      t.decimal :price, precision: 8, scale: 2
      t.string :status
      t.timestamps
      t.references :order, foreign_key: { to_table: :shopping_cart_orders }
      t.references :product, foreign_key: { to_table: ShoppingCart.product_class.to_s.downcase.pluralize.to_sym }
    end
  end
end
