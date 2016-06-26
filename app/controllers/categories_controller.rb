class CategoriesController < ApplicationController

	def category_one
		@products=Product.all
		@items=@products.where(theme_tag_id: '1')
	end

end
