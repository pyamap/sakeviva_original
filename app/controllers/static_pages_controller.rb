class StaticPagesController < ApplicationController
	def index
		@product=Product.find_by(id: '1')
	end
end
