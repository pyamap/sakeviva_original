class ConfirmMailer < ApplicationMailer

	default from: "jojimasakemedia@gmail.com"

	def confirm_email(user,order,total_price,order_product,cart)
		@order_product = order_product
		@order_user = user
		@order = order 
		@order_total_price = total_price
		@order_address = @order.user.addresses.find_by(default_address: true)

		mail(to: user.email, subject: "予約を確認しました")
	end
end
