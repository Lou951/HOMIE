class List < ApplicationRecord
  belongs_to :user
  has_many :user_lists
end
