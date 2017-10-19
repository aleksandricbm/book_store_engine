# This controller for HomeController
class HomeController < ApplicationController
  def home
    @latests = Book.author.order_id_desc.limit(3)
    @bestsellers = Category.join_tables.distinct_category.filter_status.group_cat_name_book.order_total
  end
end
