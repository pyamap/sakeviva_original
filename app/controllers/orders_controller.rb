class OrdersController < ApplicationController

before_action :authenticate_user!, except:

	def index
		@orders=Order.all
	end

	def show
	end

end
