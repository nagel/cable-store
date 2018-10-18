class Cable < ApplicationRecord

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
