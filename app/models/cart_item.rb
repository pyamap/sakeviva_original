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

	def quantity
		@quantity
	end

	def price
		@product.value
	end 

	def subtotal_price #アイテムの弌��を竃すメソッド
		@product.value * @quantity
	end

	def increment_quantity #アイテムの方楚を��やすメソッド
		@quantity += 1
	end

	def decrement_quantity #アイテムの方楚を�pらすメソッド
		@quantity -= 1
	end
end