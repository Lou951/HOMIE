class Product < ApplicationRecord
  has_many :lists, through: :list_product
  validates :item, presence: true
  validates :brand, presence: true
end
