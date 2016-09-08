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

			user=current_user
			ConfirmMailer.confirm_email(user).deliver_now

			redirect_to "/thank_you"
		end
	end

	def thank_you
		@product=Product.find_by(params[:product_id])
	end
end