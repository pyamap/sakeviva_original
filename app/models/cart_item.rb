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

	def quantity
		@quantity
	end

	def price
		@option.value
	end 

	def subtotal_price #�����ƥ��СӋ������᥽�å�
		@option.value * @quantity
	end

	def increment_quantity #�����ƥ�������򉈤䤹�᥽�å�
		@quantity += 1
	end

	def decrement_quantity #�����ƥ��������p�餹�᥽�å�
		@quantity -= 1
	end
end