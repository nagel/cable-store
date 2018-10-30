class Cable < ApplicationRecord

  validates :price, numericality: {greater_than: 0}
  validates :price, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, length: {in: 10..100}

  belongs_to :vendor # automatically creates validation that you must include vendor_id when creating cable model instance
  # def vendor
  #   Vendor.find_by(id: self.vendor_id)
  # end 

  has_many :images
  # def images
  #   Image.where(cable_id: self.id)
  # end 

  has_many :orders
  has_many :carted_products

  has_many :category_products
  has_many :categories, through: :category_products

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
