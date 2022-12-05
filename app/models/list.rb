class List < ApplicationRecord
  after_create :add_owner_to_user_list

  belongs_to :user
  has_many :user_lists, dependent: :destroy
  has_many :list_products, dependent: :destroy
  has_many :users, through: :user_lists
  validates :name, presence: true

  def add_owner_to_user_list
    UserList.create(user: user, list: self)
  end
end
