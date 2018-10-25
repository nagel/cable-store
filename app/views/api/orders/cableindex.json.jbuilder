json.array! @orders.each do |order| 
  json.id order.id
  json.user_info order.user
  json.product order.cable_id
  json.amount order.quantity
  json.subtotal order.subtotal
  json.tax order.tax
  json.total order.total
end 