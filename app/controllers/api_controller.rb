class ApiController < ApplicationController

require 'webpay'

	def purchase
		webpay = WebPay.new('test_secret_f4Z9n9bcd0RJaSDflhdd398B')
		webpay.charge.create(
		   amount: "#{Product.find_by(params[:product_id]).value}",
		   currency: "jpy",
		   card: params['webpay-token']
		)
		redirect_to "/purchased"
	end
end