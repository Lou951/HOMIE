class Product < ApplicationRecord
  has_many :lists, through: :list_product
  validates :name, presence: true
  validates :brand, presence: true
end
