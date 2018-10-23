class Image < ApplicationRecord
  def cable
    Cable.find_by(id: self.cable_id)
  end 
end
