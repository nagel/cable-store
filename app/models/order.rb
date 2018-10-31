class Order < ApplicationRecord

  # belongs_to :cable
  belongs_to :user

  has_many :carted_products

end
