class OrdersController < ApplicationController

before_action :authenticate_user!, except: [:new]

	def index
		@user = current_user
		@orders = @user.orders.all
	end

	def show
	end

	def new
		@order = Order.new
		@order.product = Product.find_by(params[:product_id])
		@user = current_user
	end

end
