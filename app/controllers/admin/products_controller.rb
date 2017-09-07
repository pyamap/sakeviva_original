class Admin::ProductsController < Admin::Base

	def index
		@products=Product.all
	end

	def search
	end

	def show
		@product=Product.find(params[:id])
		@options=@product.options
		@images=@product.images.all
	end

	def new
		@product=Product.new
		@product.options.build
		@image=@product.images.build
		@theme_tag=@product.theme_tag
		@category=@product.category
		@type=@product.type
	end

	def edit
		@product = Product.find(params[:id])
		@product.options.build
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to [:admin, @product], notice: "商品を登録しました"
		else
			render "new"
		end
	end
#		if @product.save
#			redirect_to [:admin, @product], notice: "商品を登録しました"
#		else
#			render "new"
#		end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)		
		redirect_to action: "show", notice: "情報を更新しました"
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to [:admin, @product], notice: "商品を削除しました"
	end

	def photos
		@photo = Photo.new
		@product = Product.find(params[:id])
	end

	private
	def product_params
<<<<<<< HEAD
		params.require(:product).permit(:name,:value,:description,:image, :image_cache, :theme_tag_id, :shop_id, :price_id, :category_id, :info, :remove_image, images_attributes: [:id, :product_id, :image, :image_cache], options_attributes: [:id, :title, :price])
=======
		params.require(:product).permit(:name,:description,:image, :image_cache, :theme_tag_id, :type_id, :shop_id, :price_id, :category_id, :info, :remove_image, options_attributes: [:id, :title, :product_id, :value, :_destroy ], images_attributes: [:id, :product_id, :image, :image_cache])
>>>>>>> multi-options-admin
	end

end
