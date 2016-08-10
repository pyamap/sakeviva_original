class CategoriesController < ApplicationController

	def category_first
		@products=Product.all
		@items=@products.where(theme_tag_id: '1')
	end

	def category_second
		@products=Product.all
		@items=@products.where(theme_tag_id: '2')
	end

	def category_third
		@products=Product.all
		@items=@products.where(theme_tag_id: '3')
	end

	def category_fourth
		@products=Product.all
		@items=@products.where(theme_tag_id: '4')
	end

end
