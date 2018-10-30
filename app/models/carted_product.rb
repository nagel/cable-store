class CartedProduct < ApplicationRecord

  belongs_to :order, optional: true
  belongs_to :cable
  belongs_to :user

end
