class Vendor < ApplicationRecord
  def cables
    Cable.where(vendor_id: self.id)
  end 
end
