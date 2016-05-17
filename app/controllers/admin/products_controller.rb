class Admin::ProductsController < Admin::Base

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
		@product = Product.find(params[:id])

		if @product.update(params.require(:product).permit(:name,:price,:description))
			redirect_to [:admin, @product], notice: "商品情報を更新しました"
		else
			render action: "edit"
		end
	end

	def destroy
	end

end


