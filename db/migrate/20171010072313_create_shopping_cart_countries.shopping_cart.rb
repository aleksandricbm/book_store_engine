# This migration comes from shopping_cart (originally 20170808098648)
class CreateShoppingCartCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_countries do |t|
      t.string :name

    end
  end
end
