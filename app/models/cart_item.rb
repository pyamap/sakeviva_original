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

	def subtotal_price #�����ƥ��СӋ������᥽�å�
		@product.value * @quantity
	end

	def increment_quantity #�����ƥ�������򉈤䤹�᥽�å�
		@quantity += 1
	end

	def decrement_quantity #�����ƥ��������p�餹�᥽�å�
		@quantity -= 1
	end
end