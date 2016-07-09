class AddressesController < ApplicationController

before_action :authenticate_user!

	def index
		@current_addresses=current_user.addresses
	end

	def show
	end

	def new
		@address=Address.new
	end

	def edit
	end

	def create
		@address=Address.new(address_params)
		@address.user=current_user
		if @address.save
			redirect_to :action => "index", notice:"住所を登録しました"
		else
			render "new"
		end
	end

	def update
	end

	def destroy
	end

private

	def address_params
		params.require(:address).permit(:postalcode,:prefecture_id,:address,:recipient,:tel,:user_id,:default_address)
	end

end

