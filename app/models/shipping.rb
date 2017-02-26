class Shipping < ActiveRecord::Base
	belongs_to :prefecture
	belongs_to :shop
end
