class ReviewsController < ApplicationController
  before_action :require_login
  def create
    @product = Product.find(params[:product_id].to_i)
    @review = @product.reviews.create(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product), notice: 'Review created!'
    else
      redirect_to product_path(@product), notice: 'Could not create review'
    end
  end

  def destroy
    @review = Review.find params[:id]
    @product = @review.product
    if (current_user == @review.user)
      @review.destroy
    end
    redirect_to  product_path(@product)
  end

  private
  def review_params
    params.require(:review).permit(
      :description,
      :rating,
    )
  end

  def require_login
    if (!logged_in?)
      flash[:error] = 'You need to log in to create a review'
      redirect_to root_path
    end
  end

end
