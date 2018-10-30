class Category < ApplicationRecord

  has_many :category_products
  has_many :cables, through: :category_products

end
