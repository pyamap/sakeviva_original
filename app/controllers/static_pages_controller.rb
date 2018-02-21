class StaticPagesController < ApplicationController

	before_filter :current_cart

	def index
		@new_products = Product.find([35,36,37,46])
		@popular_products_pc = Product.find([33,34,35,36,38,40,41,42,43])
		@popular_products_sp = Product.find([34,35,36,37])
	end

  def about_us
  end

  def mypage
  end

  def mypage_order
  	respond_to do |format|
	  	format.js {render layout: false}
  	end
  end

  def mypage_address
  	@current_addresses=current_user.addresses
  	respond_to do |format|
  		format.js {render layout: false}
  	end
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
