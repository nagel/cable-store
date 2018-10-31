json.array! @carts.each do |cart|
  json.id cart.id
  json.user cart.user_id
  json.amount cart.quantity
end
