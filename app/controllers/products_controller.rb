class ProductsController < ApplicationController

before_action :authenticate_user!, only:[:add_to_cart]
before_filter :current_cart

	attr_accessor :product

	def index
		@products = Product.all
	end

	def search
	end

	def show
		@product = Product.find(params[:id])
		@options = @product.options
		@images = @product.images.all
		@recommended_products = Product.where(category_id: @product.category_id).order("RANDOM()").where(status: true).limit(4)

		@reviews = Review.where(product_id: @product.id)
		if @reviews.blank?
			@avg_rating = 0
		else
			@avg_rating = @reviews.average(:score)
		end

	end

	def new
		@product = Product.new
	end

	def edit
		@product = Product.find(params[:id])
	end

	def create
	end

	def update
	end

	def destroy
	end

	def add_to_cart
		product = Product.find(params[:id])
		@cart = find_cart
		quantity = params[:quantity].to_i
		@options = product.options
		option = @options.find_by(id: params[:option_id])
		@cart.add_product(product,quantity,option)
		cookies.delete(:total_shipping_fee)
		redirect_to_current_cart("カートに商品を追加しました")
	end

	def empty_cart
		session[:cart] = nil
		cookies.delete(:total_shipping_fee)
		cookies.delete(:total_price)
		redirect_to_current_cart("カートは空にしました")
	end

	def decrement_from_cart
		product = Product.find(params[:id])
		@cart = find_cart
		@cart.decrement_product(product)
		redirect_to_current_cart("数量を１つ減らしました")
	end

	def delete_from_cart
		product = Product.find(params[:id])
		@cart = find_cart
		@cart.delete_product(product)
		cookies.delete(:total_shipping_fee)
		redirect_to_current_cart ("商品をカートから削除しました")
	end

	def current_cart
		@prefecture_id = flash[:prefecture_id]
	  #shipping controllerからprefectureを受け取って、更新後も選択できる状態にしておく。
		@total_shipping_fee = cookies[:total_shipping_fee].to_i
		#shipping controllerからtotal_shipping_feeを受け取って、更新後も選択できる状態にしておく。
    @cart = find_cart
	end

	def option_value
		render partial: 'option_value', locals: {option_id: params[:option_id]}
	end


	private

	def find_cart
		unless session[:cart]
			session[:cart] = Cart.new
		end
		session[:cart]
	end


	def redirect_to_current_cart(msg)
		flash[:notice] = msg
		redirect_to :action => "current_cart"
	end

end
