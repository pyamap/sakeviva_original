class Admin::ProductsController < Admin::Base

before_action :authenticate_user!, except: #deviseによるログイン精査の為のコード. except: :indexでホーム画面以外は基本的にログインがいる状態にしてある。


	def index
		@products=Product.all
	end

	def search
	end

	def show
		@product=Product.find(params[:id])
		@images=@product.images.all
	end

	def new
		@product=Product.new
		@image=@product.images.build
		@theme_tag=@product.theme_tag
		@type=@product.type
	end

	def edit
		@product=Product.find(params[:id])
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			params[:images]['image'].each do |a|
				@image=@product.images.create!(:image => a)
			end
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

		if @product.update(params.require(:product).permit(:name,:price,:description,:image,:overview_one,:overview_two,:story_title_one,:story_title_two,images_attributes: [:id, :product_id, :image]))
			redirect_to [:admin, @product], notice: "商品情報を更新しました"
		else
			render action: "edit"
		end
	end

	def destroy
	end

	private
	def product_params
		params.require(:product).permit(:name,:price,:description,:image,:overview_one,:overview_two,:story_title_one,:story_title_two,images_attributes: [:id, :product_id, :image])
	end

end
