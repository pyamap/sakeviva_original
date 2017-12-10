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
		@recommended_products = Product.where(category_id: @product.category_id).order("RANDOM()").limit(4)
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
		(session[:selected_options] ||= []) && (session[:selected_options] << params[:option_id])
		@cart.add_product(product,quantity,option)
		session[:total_shipping_fee] = nil
		redirect_to_current_cart("数量を増やしました")
	end

	def empty_cart
		session[:cart] = nil
		session[:total_shipping_fee] = nil
		session[:total_price] = nil
		session[:selected_options] = nil #保存していたオプションIDも破棄しないと最後order mailの中に入ってきちゃう。
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
		redirect_to_current_cart ("商品をカートから削除しました")
	end

	def current_cart
		@prefecture_id = flash[:prefecture_id]
	  #shipping controllerからprefectureを受け取って、更新後も選択できる状態にしておく。
		@total_shipping_fee = session[:total_shipping_fee]
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
