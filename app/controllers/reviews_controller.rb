class ReviewsController < ApplicationController

  def index
    @orders = current_user.orders
    @review = Review.new
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @review = Review.new (review_params)
    @review.user = current_user
    @review.product = Product.find(params[:review][:product_id])
    @review.order = Order.find(params[:review][:order_id])
    if @review.save
      @review.order.update_attribute(:review_flag, true)
      redirect_to :back, notice:"レビューの投稿が完了しました"
    else
      @orders = current_user.orders
      render "index"
    end
  end

  def updated
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:product_id, :user_id, :score, :comment, :title)
  end
end
