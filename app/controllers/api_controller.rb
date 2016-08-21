class ApiController < ApplicationController

require 'webpay'

	def purchase
		webpay = WebPay.new('test_secret_f4Z9n9bcd0RJaSDflhdd398B')
		webpay.charge.create(
		   amount: "#{Product.find_by(params[:product_id]).value}",
		   currency: "jpy",
		   card: params['webpay-token']
		)
		@order=Order.new
		@order.user=current_user
		@order.product=Product.find_by(params[:product_id])
		if @order.save
			redirect_to "/purchased"
		end
	end

	def purchased
		@product=Product.find_by(params[:product_id])
	end
end