class UsersController < ApplicationController

	def index
	end

	def show
	end

	def new
		@user = User.find(params[:id])
	end

	def edit
	end

	def create
	
	end

	def destroy
	end

	def update
	end


	private
	def user_params
		params.require(:user).permit(:address,:user_id)
	end

end
