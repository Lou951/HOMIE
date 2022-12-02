class Product < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [ :item, :brand ]
  has_many :lists, through: :list_product
  validates :item, presence: true
  validates :brand, presence: true
  validates :image_url, presence: true, uniqueness: true

  def to_s
    self.item
  end
end
