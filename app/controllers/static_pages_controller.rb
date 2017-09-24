class StaticPagesController < ApplicationController

	before_filter :current_cart

	def index
		@new_products = Product.find([34,35,36,37])
		@popular_products = Product.find([34,35,36,37,38,39,40,41,42])
  end

  def about_us
  end

	def interview_tanaka_noodle
	end

	def interview_souen_rush
	end

	def interview_chiyo_seaweed
	end

	def current_cart
		@total_shipping_fee = flash[:total_shipping_fee]
    	@cart = find_cart
	end

	private

	def find_cart
		unless session[:cart]
			session[:cart] = Cart.new
		end
		session[:cart]
	end
end
