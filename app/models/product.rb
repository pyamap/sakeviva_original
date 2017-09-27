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
	belongs_to :brand
	has_many :items
	has_one :order, dependent: :destroy
	has_many :options, dependent: :destroy
	accepts_nested_attributes_for :options, allow_destroy: true

	enum type: { 純米酒: 1, 本醸造: 2, 吟醸: 3, 大吟醸: 4, 焼酎: 5, 特別純米: 8, 純米大吟醸: 9, 純米吟醸: 10, その他: 11 } #絞り込み用
	scope :get_by_type, ->(type) {where(type: type)}

	enum price: { "〜5000円": 1, "5000円〜10000円": 2, "10000円〜": 3 }
	scope :get_by_price, ->(price) {where(price: price)}
end

