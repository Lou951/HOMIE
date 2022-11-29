class List < ApplicationRecord
  belongs_to :user
  has_many :users, through: :user_list
  validates :name, presence: true
end
