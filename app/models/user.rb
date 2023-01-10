class User < ApplicationRecord
  has_many :lists
  has_many :user_lists
  has_many :lists, through: :user_lists
  has_many :purchases
  has_many :list_products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  def list_purchases(list)
    Purchase.where(
      list_product_id: list.list_products.pluck(:id)
    ).where(
      user_id: id
    ).sum(&:price_paid)
  end

  def all_purchases(list)
    Purchase.where(
      list_product_id: list.list_products.pluck(:id)
    ).sum(&:price_paid)
  end

  def user_difference(list)
    (self.list_purchases(list) - (self.all_purchases(list) / list.users.count)).round(2)
  end
end
