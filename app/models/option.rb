class Option < ActiveRecord::Base
	belongs_to :product

<<<<<<< HEAD
	attr_accessor :options_attributes
=======
	validates :title,  presence: true
	validates :value,  presence: true

>>>>>>> multi-options-admin
end
