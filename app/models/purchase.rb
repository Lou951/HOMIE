class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :list_product
  validates :price_paid, presence: true
end
