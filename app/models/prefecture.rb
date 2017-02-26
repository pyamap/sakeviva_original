class Prefecture < ActiveRecord::Base
	has_one :address, dependent: :destroy
	has_one :shippings
end
