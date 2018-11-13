class Image < ApplicationRecord

  belongs_to :cable
  # def cable
  #   Cable.find_by(id: self.cable_id)
  # end 
end
