class Image < ActiveRecord::Base
	#これはimageモデルから商品画像をあげる際に必要。
	mount_uploader :image, ImageUploader
	belongs_to :product
end
