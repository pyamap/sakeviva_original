class Category < ActiveRecord::Base
	has_one :product, dependent: :destroy
end
