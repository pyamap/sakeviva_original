class Option < ActiveRecord::Base
	belongs_to :product

	attr_accessor :options_attributes
end
