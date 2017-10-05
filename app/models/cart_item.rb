class CartItem
	attr_reader :product, :quantity, :option

	def initialize (product,quantity,option)
		@product = product
		@quantity = quantity.to_i
		@option = option
	end

	def name
		@product.name
	end

	def description
		@product.description
	end

	def id
		@product.id
	end

	def image
		@product.image
	end

	def quantity
		@quantity.to_i
	end

	def price
		@option.value
	end

	def subtotal_price #アイテムの小計を出すメソッド
		@option.value * @quantity.to_i
	end

	def increment_quantity #アイテムの数量を増やすメソッド
		@quantity = @quantity.to_i + 1
	end

	def decrement_quantity #アイテムの数量を減らすメソッド
		@quantity = @quantity.to_i - 1
	end
end