class AddressesController < ApplicationController

before_action :authenticate_user!

	def index
		@current_address=current_user.addresses.where(default_address: true)
		@current_addresses=current_user.addresses
#		if @current_addresses.empty?
#			redirect_to :action => "new"
#		end
	end

	def show
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
		current_user.addresses.where.not(id: params[:id]).update_all(default_address: false)
		if @address.save
			redirect_to :action => "index", notice:"住所を登録しました"
		else
			render "new"
		end
	end

	def update
		@current_address=Address.find(params[:address])
		current_user.addresses.where.not(id: params[:id]).update_all(default_address: false)
		@current_address.update_column(:default_address, true)
		@quantity=params[:quantity]
		@product=Product.find(params[:product_id])
		@current_address.save
	end

	def destroy
		@address=Address.find{params[:id]}
		@address.destroy
		redirect_to :addresses, notice:"住所を削除しました"
	end

	def decide_address
		@current_address=Address.find(params[:address])
		current_user.addresses.where.not(id: params[:id]).update_all(default_address: false)
		@current_address.update_column(:default_address, true)
		@quantity=params[:quantity]
		@product=Product.find(params[:product_id])
		@current_address.save
	end

private

	def address_params
		params.require(:address).permit(:postalcode,:prefecture_id,:address,:recipient,:tel,:user_id,:default_address)
	end

end

