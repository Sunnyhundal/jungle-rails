class Admin::DashboardController < ApplicationController
  def show
    @products_count = Product.count
    @categories_count = Product.group(:category_id).count

  end
end
