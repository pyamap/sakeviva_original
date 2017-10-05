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

	def subtotal_price #�����ƥ��СӋ������᥽�å�
		@option.value * @quantity.to_i
	end

	def increment_quantity #�����ƥ�������򉈤䤹�᥽�å�
		@quantity = @quantity.to_i + 1
	end

	def decrement_quantity #�����ƥ��������p�餹�᥽�å�
		@quantity = @quantity.to_i - 1
	end
end