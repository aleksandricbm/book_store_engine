# This migration comes from shopping_cart (originally 20171009134626)
class CreateShoppingCartCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_coupons do |t|
      t.string :code
      t.decimal :price, precision: 8, scale: 2
    end
  end
end
