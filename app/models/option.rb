class Option < ActiveRecord::Base
	belongs_to :product

	validates :title,  presence: true
	validates :value,  presence: true

end
