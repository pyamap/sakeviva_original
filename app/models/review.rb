class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_one :order

  validates :title, presence: true
  validates :comment, presence: true
  validates :score, presence: true
end
