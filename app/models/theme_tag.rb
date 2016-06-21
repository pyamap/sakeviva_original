class ThemeTag < ActiveRecord::Base
	has_one :product, dependent: :destroy
end
