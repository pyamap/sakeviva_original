class PayjpController < ApplicationController

	require 'payjp'

	before_filter :current_cart
	#before_action :ordered_product, only:[:index, :new, :pay]

	def index
		@current_address = Address.find(params[:address])
		@total_price = session[:total_price]
		@total_shipping_fee = session[:total_shipping_fee]
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
		Payjp.api_key = 'sk_live_59afb933e6fad56abe00d3dac5cd1562902a1fc9df05dacb5befc109'
		charge = Payjp::Charge.create(
		:amount => params[:total_price],
		:card => params['payjp-token'],
		:currency => 'jpy',
		)

		cart = @items

		params[:items].each do |single_item|
			@order = Order.new
			@order.product = Product.find(single_item["item_id"])
			@order.quantity = single_item[:item_quantity]
			@order.user = User.find(params[:current_user])
			@order.save
		end

		unique_order = @order
		user = @order.user
		total_price = params[:total_price]
		total_shipping_fee = params[:total_shipping_fee]
		items = params[:items]

		ConfirmMailer.confirm_email(user,unique_order,total_price,total_shipping_fee,items).deliver_now
		session[:cart] = nil
		redirect_to "/thank_you"
	end

	def thank_you
		@product=Product.find_by(params[:product_id])
	end


	private

	def order_params
		params.require(:order).permit(:quantity)
	end


	#def ordered_product
		#@order = Order.new
	#	@order.user = current_user
		#@order.product = Product.find(params[:product_id])
	#end

end
