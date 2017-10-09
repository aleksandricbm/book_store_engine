# This migration comes from shopping_cart (originally 20171004123755)
class CreateShoppingCartOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_order_items do |t|
      # t.belongs_to :book, foreign_key: true
      # t.belongs_to :shopping_cart_order, foreign_key: :order_id
      t.integer :quantity
      t.decimal :price, precision: 8, scale: 2
      t.string :status
      t.timestamps
      t.references :order, foreign_key: { to_table: :shopping_cart_orders }
    end
  end
end
