class Api::OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)

    render "cableindex.json.jbuilder"
  end

  def create

    #Retrieves specific cable for cable model 
    cable_id = params["cable_id"]
    cable = Cable.find_by(id: cable_id)

    quantity = params["quantity"].to_i

    @order = Order.new(
      user_id: current_user.id, 
      cable_id: cable_id,
      quantity: quantity,
      subtotal: cable.price * quantity, 
      tax: quantity * cable.tax,
      total: cable.total * quantity
    )

    @order.save

    render json: {message: "Order created successfully!", subtotal: @order.subtotal, tax: @order.tax, total: @order.total}

  end 

end
