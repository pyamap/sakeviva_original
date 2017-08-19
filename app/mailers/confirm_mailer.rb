class ConfirmMailer < ApplicationMailer

	default from: "jojimasakemedia@gmail.com"

	def confirm_email(user,unique_order,total_price,total_shipping_fee,items)
		@order_user = user
		@unique_order = unique_order
	
		@order_items = items

		@order_total_price = total_price
		@total_shipping_fee = total_shipping_fee
		@order_address = @order_user.addresses.find_by(default_address: true)

		mail(to: user.email, subject: "予約を確認しました")
	end
end
