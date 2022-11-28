class User < ApplicationRecord
  has_many :lists
  has_many :user_lists
  has_many :purchases
  has_many :list_products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
