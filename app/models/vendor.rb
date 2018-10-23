class Vendor < ApplicationRecord

  has_many :products
  # def cables
  #   Cable.where(vendor_id: self.id)
  # end 
end
