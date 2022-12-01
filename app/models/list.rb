class List < ApplicationRecord
  belongs_to :user
  has_many :user_lists
  has_many :users, through: :user_lists
  validates :name, presence: true
end
