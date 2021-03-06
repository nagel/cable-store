class Api::CartedProductsController < ApplicationController

  def index
    user_id = current_user.id

    @carts = CartedProduct.where(user_id: user_id, status: "Carted")

    render "index.json.jbuilder"
  end

  def create

    user_id = current_user.id

    @cart = CartedProduct.new({
      user_id: user_id,
      cable_id: params[:cable_id],
      quantity: params[:quantity],
      status: "Carted"
      #order_id: Not included since the order needs to be made firstC
    })
    @cart.save

    render json: {message: "order saved!"}

  end 

  def delete

    user_id = current_user.id

    @cart = CartedProduct.where(user_id: user_id, status: "Carted")

    #pp @cart

    @cart = CartedProduct.update({
      status: "Removed"
    })

    # if 
    #   render json: {message: "Carted cables have been removed."}
    # else
    #   render json: {message: "Failed."}
    # end

  end 

end
