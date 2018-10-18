class Api::CablesController < ApplicationController

  def index
    #@cables is an instance of the Cable class and contains all the data instances (in an array) from the Cable model
    @cables = Cable.all

    render "index.json.jbuilder"
  end 

  def show
    @cable = Cable.find_by(id: params["id"])

    render "show.json.jbuilder"
  end 

  def create
    @cable = Cable.new(
      name: params["name"],
      price: params["price"],
      length: params["length"],
      function: params["function"],
      model_year: params["model_year"],
      description: params["description"],
      in_stock: params["in_stock"])
    @cable.save

    render "show.json.jbuilder"
  end 

  def update
    @cable = Cable.find_by(id: params["id"])
    @cable.update(
      name: params["name"] || @cable.name, 
      price: params["price"] || @cable.price,
      length: params["length"] || @cable.length,
      function: params["function"] || @cable.function,
      model_year: params["model_year"] || @cable.model_year,
      image_url: params["image_url"] || @cable.image_url,
      description: params["description"] || @cable.description,
      in_stock: params["in_stock"] || @cable.in_stock
    )

    #render json: {message: "Data successfully updated!"}
    render "show.json.jbuilder"

  end 

  def delete
    @cable = Cable.find_by(id: params["id"])
    @reference = @cable
    @cable.destroy

    render json: {message: "#{@reference.name} has been removed from the database."}
  end 

end
