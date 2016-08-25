class PricesController < ApplicationController

	def show
		@price=Price.find(params[:id])
	end

end
