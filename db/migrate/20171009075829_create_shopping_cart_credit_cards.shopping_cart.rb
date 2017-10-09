# This migration comes from shopping_cart (originally 20171004135449)
class CreateShoppingCartCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_credit_cards do |t|
      t.bigint :number
      t.string :name
      t.string :expired
      t.integer :cvv
      t.belongs_to :order, foreign_key: { to_table: :shopping_cart_orders }
      t.timestamps
    end
  end
end
