class Shop < ActiveRecord::Base
	has_many :shippings
	has_many :products
end
