class Admin::OrdersController < Admin::Base

	def index
		@orders=Order.order("id")
	end

	def show
		@order=Order.find(params[:id])
		@user=@order.user
		@current_address=@user.addresses.find_by(:default_address => true)
	end

	def update
		@order=Order.find(params[:id])
		if @order.delivery_id == 1
		@order.update_attribute(:delivery_id, 2)
		else
		@order.update_attribute(:delivery_id, 3)
		end
		if @order.save
			redirect_to :action => "show"
		end
	end
end