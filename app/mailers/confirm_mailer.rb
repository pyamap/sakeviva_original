class ConfirmMailer < ApplicationMailer

	default from: "jojimasakemedia@gmail.com"

	def confirm_email(unique_order,user,shipping_address,total_price,total_shipping_fee,items)
		@order_user = user
		@unique_order = unique_order
		@shipping_address = shipping_address
		@order_items = items
		@order_total_price = total_price
		@total_shipping_fee = total_shipping_fee
		@order_address = @order_user.addresses.find_by(default_address: true)

		mail(to: user.email, subject: "予約を確認しました")
	end
end
