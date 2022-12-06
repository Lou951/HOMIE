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

  def list_products_total(list)
    sum = 0
    list.list_products.each do |el|
      el.purchases.each {|purchase| sum += purchase.price_paid}
    end
    sum
  end

  def self.card_pic(placeholder)
    case placeholder.capitalize
    when "Home"
      "https://res.cloudinary.com/de4yia9u4/image/upload/v1670242444/z69cn8xetmwbandw4w3m.jpg"
    when "Work"
      "https://res.cloudinary.com/de4yia9u4/image/upload/v1670241974/kgiay14unp5lnaqjhmsg.jpg"
    when "Personal"
      "https://res.cloudinary.com/de4yia9u4/image/upload/v1670242329/xhstoanskcdd8cbzvf6g.jpg"
    else
      "https://res.cloudinary.com/de4yia9u4/image/upload/v1670242272/zmd5aud9kmf1e4rzwsrb.jpg"
    end
  end
end
