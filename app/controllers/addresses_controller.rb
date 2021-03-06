class AddressesController < ApplicationController

before_action :current_cart, :authenticate_user!

	def index
		@current_addresses=current_user.addresses
		if @current_addresses.empty?
			redirect_to :action => "new"
		end
	end

	def show
		@current_address=Address.find(params[:id])
		@quantity=params[:quantity]
		@product=Product.find(params[:product_id])
	end

	def new
		  @address=Address.new
	end

	def edit
		@address=Address.find(params[:id])
	end

	def create
		@address=Address.new(address_params)
		@address.user=current_user
		if @address.valid?
			current_user.addresses.where.not(id: params[:id]).update_all(default_address: false)
			@address.update_attribute(:default_address, true)
			redirect_to controller: 'payjp', :action => 'index',:address => @address.id, :total_price => params[:total_price]
		else
			render "new"
		end
	end

	def update
		@current_address=Address.find(params[:id])
		current_user.addresses.where.not(id: params[:id]).update_all(default_address: false)
		@current_address.update_column(:default_address, true)
		@current_address.update(address_params)
		redirect_to :action => "index"
	end

	def destroy
		@address=Address.find(params[:id])
		@address.destroy
		redirect_to :addresses, notice:"住所を削除しました"
	end

	def decide_address
		@product = Product.find(params[:product_id])
	end

private

	def address_params
		params.require(:address).permit(:postalcode,:prefecture_id,:address,:recipient,:tel,:user_id,:default_address)
	end

end

