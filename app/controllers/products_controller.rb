class ProductsController < ApplicationController

	def index
		@products=Product.all
	end

	def search
	end

	def show
		@product=Product.find(params[:id])
	end

	def new
		@product=Product.new
	end

	def edit
		@product=Product.find(params[:id])
	end


	def create
	end

	def update
	end

	def destroy
	end
end
