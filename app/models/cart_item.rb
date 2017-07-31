class CartItem
	attr_reader :product, :quantity

	def initialize (product)
		@product = product
		@quantity = 1
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
		@quantity
	end

	def price
		@product.value
	end 

	def subtotal_price #アイテムの小計を出すメソッド
		@product.value * @quantity
	end

	def increment_quantity #アイテムの数量を増やすメソッド
		@quantity += 1
	end

	def decrement_quantity #アイテムの数量を減らすメソッド
		@quantity -= 1
	end
end