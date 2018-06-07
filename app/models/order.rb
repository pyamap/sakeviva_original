class Order < ActiveRecord::Base
belongs_to :user
belongs_to :delivery
has_many :items
belongs_to :product
accepts_nested_attributes_for :items, allow_destroy: true
belongs_to :review
end
