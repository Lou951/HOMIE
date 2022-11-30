class Product < ApplicationRecord
  has_many :lists, through: :list_product
  validates :item, presence: true
  validates :brand, presence: true
  validates :image_url, presence: true, uniqueness: true
end
