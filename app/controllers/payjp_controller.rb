class PayjpController < ApplicationController

	require 'payjp'

	before_filter :current_cart
	#before_action :ordered_product, only:[:index, :new, :pay]

	def index
		@current_address = Address.find(params[:id])
		#@quantity = params[:quantity]
		#@total_price = "#{@order.product.value*@quantity.to_i}"
	end

	def new
		@current_address = Address.find(params[:address])
		@quantity = params[:quantity]
		@delivery_fee = Shipping.find_by("shop_id = ? and prefecture_id = ?", params[:shop_id], params[:prefecture_id]).fee
		@total_price = @order.product.value*@quantity.to_i + @delivery_fee
	end

	def pay #payjpの決算がおりるメソッド
		Payjp.api_key = 'sk_test_e3591175b23241e952c79a40'
		charge = Payjp::Charge.create(
		:amount => params[:total_price],
		:card => params['payjp-token'],
		:currency => 'jpy',
		)

		cart = @items

		params[:items].each do |single_item|
			@order = Order.new
			@order.product = Product.find(single_item["item_id"])
			@order.user = User.find(params[:current_user]) 
			@order.save
		end

		user = @order.user
		
		#if order.save			
	
			ConfirmMailer.confirm_email(user).deliver_now

			redirect_to "/thank_you"
		#end
	end

	def thank_you
		@product=Product.find_by(params[:product_id])
	end


	private

	def order_params
		params.require(:order).permit(:product_id => "#{item_id}")
	end


	#def ordered_product
		#@order = Order.new
	#	@order.user = current_user
		#@order.product = Product.find(params[:product_id])
	#end

end
