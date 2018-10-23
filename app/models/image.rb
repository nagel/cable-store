class Image < ApplicationRecord

  belongs_to :cables
  # def cable
  #   Cable.find_by(id: self.cable_id)
  # end 
end
