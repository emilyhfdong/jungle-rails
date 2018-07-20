class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc).includes(:reviews)
  end

  def show
    @product = Product.find params[:id]
    @reviews = @product.reviews.includes(:user)
    @rating = (@reviews.average(:rating)).round(2)
    @logged_in = logged_in?
    @current_user = current_user
  end

end
