class Cart
	attr_reader :items

	def initialize
		@items = []
	end

	def add_product(product)
		current_item = @items.find { |item| item.product == product }
		#@itemsの中にあるproductとadd_to_cartに代入。
		if current_item
			current_item.increment_quantity
		else
			@items << CartItem.new(product)
		end
	end

	def decrement_product(product)
		current_item = @items.find {|item| item.product == product }
		if current_item.decrement_quantity == 0
			@items.delete(current_item)
		end
	end

	def delete_product(product)
		current_item = @items.find { |item| item.product == product }
		@items.delete(current_item)
	end

	def total_price
        @items.sum {|product| product.subtotal_price}
    end

    def total_quantity
    	@product.quantity.inject(:+)
    end

end
