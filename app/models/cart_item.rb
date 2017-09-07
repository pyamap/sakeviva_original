class CartItem
	attr_reader :product, :quantity, :option

	def initialize (product,option)
		@product = product
		@quantity = 1
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
		@quantity
	end

	def price
		@option.value
	end 

	def subtotal_price #アイテムの弌��を竃すメソッド
		@option.value * @quantity
	end

	def increment_quantity #アイテムの方楚を��やすメソッド
		@quantity += 1
	end

	def decrement_quantity #アイテムの方楚を�pらすメソッド
		@quantity -= 1
	end
end