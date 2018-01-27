class CategoriesController < ApplicationController

	def category_sake
		@sake_products = Product.all.where(category_id: 1).where(status: true).order(:id)

		if params[:type].present?
			@sake_products = @sake_products.get_by_type params[:type]
			@product_type = params[:type]
		end

		if params[:price].present?
			@sake_products = @sake_products.get_by_price params[:price]
			@product_price = params[:price]
		end

		if params[:brand].present?
			@sake_products = @sake_products.get_by_brand params[:brand]
			@product_brand = params[:brand]
		end
		#PGadminにbrandテーブルと中身を足す必要あり。=>カラム追加完了したので、中身を足す。
	end

	def category_grocery
		@grocery_products = Product.all.where(category_id: 2).where(status: true).order(:id)
	end

	def category_food
		@food_products = Product.all.where(category_id: 3).where(status: true).order(:id)
	end

	def category_craft
		@craft_products = Product.all.where(category_id: 4).where(status: true).order(:id)
	end

	def category_first
		@products=Product.all
		@items=@products.where(theme_tag_id: '1').where(status: true)
	end

	def category_second
		@products=Product.all
		@items=@products.where(theme_tag_id: '2').where(status: true)
	end

	def category_third
		@products=Product.all
		@items=@products.where(theme_tag_id: '3').where(status: true)
	end

	def category_fourth
		@products=Product.all
		@items=@products.where(theme_tag_id: '4').where(status: true)
	end

end
