class Product < ActiveRecord::Base
	mount_uploader :image, ImageUploader #これはproductモデルから商品画像をあげる際に必要。
	has_many :images
	accepts_nested_attributes_for :images

	validates :name,:description, presence: true
	validates :price, numericality: { only_integer: true, greater_than: 0}
	validates :overview_one,:overview_two, presence: true, length:{maximum: 300}
end
