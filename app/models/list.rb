class List < ApplicationRecord
  belongs_to :user
  has_many :user_lists, dependent: :destroy
  has_many :list_products, dependent: :destroy
  has_many :users, through: :user_lists
  validates :name, presence: true
end
