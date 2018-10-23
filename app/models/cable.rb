class Cable < ApplicationRecord

  validates :price, numericality: {greater_than: 0}
  validates :price, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, length: {in: 10..100}

  def vendor
    Vendor.find_by(id: self.vendor_id)
  end 

  def images
    Image.where(cable_id: self.id)
  end 

  def is_discounted?
    if self.price < 10
      "Discounted!"
    else
      "Normal Price."
    end 
  end 

  def tax
    self.price * 0.09
  end 

  def total
    self.price + self.tax
  end 

end
