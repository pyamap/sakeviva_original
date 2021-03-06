class Address < ActiveRecord::Base

	belongs_to :user
	belongs_to :prefecture
	validates :recipient, presence: true
  validates :postalcode, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :prefecture_id, presence: true
	validates :address, presence: true
	validates :tel, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
