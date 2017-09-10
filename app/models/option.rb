class Option < ActiveRecord::Base
	attr_accessor :options_attributes
	belongs_to :product
end
