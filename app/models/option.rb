class Option < ActiveRecord::Base
	attr_accessor :options_attributes

	belongs_to :product
	validates :title,  presence: true
	validates :value,  presence: true
end
