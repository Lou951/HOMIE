class ListProduct < ApplicationRecord
  belongs_to :user
  belongs_to :list
  belongs_to :product
  has_many :purchases, dependent: :destroy
  validates :frequency, presence: true

  def countdown
    (self.next_purchase - Date.today).to_i
  end
end
