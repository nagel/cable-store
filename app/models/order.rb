class Order < ApplicationRecord

  belongs_to :cable
  belongs_to :user

end
