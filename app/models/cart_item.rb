class CartItem
	attr_reader :product, :quantity, :option

	def initialize (product,quantity,option)
		@product = product
		@quantity = quantity
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

	def subtotal_price #アイテムの弌��を竃すメソッド
		@option.value * @quantity.to_i
	end

	def increment_quantity #アイテムの方楚を��やすメソッド
		@quantity += 1
	end

	def decrement_quantity #アイテムの方楚を�pらすメソッド
		@quantity -= 1
	end
end