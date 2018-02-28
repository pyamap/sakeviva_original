class PayjpController < ApplicationController
	require 'payjp'
	include ShippingCalculator

	before_filter :current_cart
	#before_action :check_sender, only:[:index]
	#before_action :ordered_product, only:[:index, :new, :pay]

	def index

		if params[:address].nil?
			redirect_to addresses_path, alert: "住所を選択してください"
			return
		end

		unless session[:current_address].present?
			session[:current_address] = Address.find(params[:address])
		end
		@user = current_user
		if @user.sender.blank? || @user.mobile.blank?
			redirect_to edit_user_registration_path, alert: "配送に必要な情報を入力してください"
		end
		@current_address = session[:current_address]
		@prefecture_id = @current_address.prefecture.id #実際に選んだ住所のprefecture_id
		calculator #shipping_calculator内のcalculatorメソッドをコール
		@total_price_tax = (@cart.total_price + session[:total_shipping_fee])* 1.03
		@total_price = @total_price_tax.floor
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
		if Rails.env == 'development'
			Payjp.api_key = 'sk_test_e3591175b23241e952c79a40'
		else
			Payjp.api_key = 'sk_live_59afb933e6fad56abe00d3dac5cd1562902a1fc9df05dacb5befc109'
		end
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
		shipping_address = Address.find(params[:shipping_address])
		selected_options = session[:selected_options]

		ConfirmMailer.confirm_email(unique_order,user,shipping_address,total_price,total_shipping_fee,items,selected_options).deliver_now
		session[:cart] = nil
		session[:total_shipping_fee] = nil
		session[:total_price] = nil
		session[:selected_options] = nil
		session[:current_address] = nil
		redirect_to "/thank_you"
	end

	def thank_you
		@product=Product.find_by(params[:product_id])
	end


	private

	def order_params
		params.require(:order).permit(:quantity)
	end

	def check_sender
		@user = current_user
		if @user.sender.blank? || @user.mobile.blank?
			redirect_to edit_user_registration_path
		end
	end

	#def ordered_product
		#@order = Order.new
	#	@order.user = current_user
		#@order.product = Product.find(params[:product_id])
	#end

end
