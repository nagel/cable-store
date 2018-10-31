class Api::OrdersController < ApplicationController
  
  before_action :authenticate_user

  def index
    @orders = Order.where(user_id: current_user.id)

    render "cableindex.json.jbuilder"
  end

  def create

    user_id = current_user.id

    user_order = CartedProduct.where(user_id: user_id, status: "Carted")

    subtotal = 0
    tax = 0
    total = 0

    user_order.each do |user_order|
      subtotal = subtotal + user_order.cable.price * user_order.quantity
      tax = tax + user_order.cable.tax * user_order.quantity
      total = total + user_order.cable.tax * user_order.quantity
      user_order.status = "Purchased"
      user_order.save
    end 

    @order = Order.new(
      user_id: user_id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @order.save

    if current_user
      render json: {message: "Order created successfully!", user: @order.user_id, subtotal: @order.subtotal, tax: @order.tax, total: @order.total}
    else
      render json: {message: "Please login!"}
    end
  end 

end
