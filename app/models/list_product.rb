class ListProduct < ApplicationRecord
  belongs_to :user
  belongs_to :list
  belongs_to :product
end
