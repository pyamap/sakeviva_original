class Product < ActiveRecord::Base
	attr_accessor :image, :image_cache
	mount_uploader :image, ImageUploader #これはproductモデルから商品画像をあげる際に必要。
	has_many :images
	has_many :photos
	accepts_nested_attributes_for :images, allow_destroy: true

	#validates :value, numericality: { only_integer: true, greater_than: 0}
	#↑登録の際に"valueは数値にしてください"とエラーが出るので、一旦コメントアウトでworkする。
	validates :name,:description, presence: true

	belongs_to :category
	belongs_to :theme_tag
	belongs_to :type
	belongs_to :price
	belongs_to :shop
	has_many :items
	has_one :order, dependent: :destroy
	has_many :options, dependent: :destroy
	accepts_nested_attributes_for :options, allow_destroy: true
end

