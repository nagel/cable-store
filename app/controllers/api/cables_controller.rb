class Api::CablesController < ApplicationController

  def index
    #@cables is an instance of the Cable class and contains all the data instances (in an array) from the Cable model
    @cables = Cable.all

    #allows user to search by array
    @user_input = params["name"]

    #user can determine if they want to sort by price
    @sort_price = params["sort_price"].to_i

    if @user_input
      @cables = @cables.where("name ILIKE ?", "%#{@user_input}%")
    end 

    if @sort_price == 1
      @cables = @cables.order(:price)
    else 
      @cables = @cables.order(:id)
    end
    
    render "index.json.jbuilder"

  end 

  def show
    #using singular naming convention since I'm only showing 1 instance of the model object
    @cable = Cable.find_by(id: params["id"])

    render "show.json.jbuilder"
  end 

  def create
    #using singular naming convention since I'm only creating 1 instance of the model object
    @cable = Cable.new(
      name: params["name"],
      price: params["price"],
      length: params["length"],
      function: params["function"],
      model_year: params["model_year"],
      description: params["description"],
      in_stock: params["in_stock"])
    @cable.save

    if @cable.save
      render "show.json.jbuilder"
    else
      render json: {error: @cable.errors}, status: 400 
    end

  end 

  def update
    #using singular naming convention since I'm only updating 1 instance of the model object
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

    if @cable.save
      #render json: {message: "Data successfully updated!"}
      render "show.json.jbuilder"
    else
      render json: {error: @cable.errors}, status: 400 
    end 

  end 

  def delete
    #using singular naming convention since I'm only deleting 1 instance of the model object
    @cable = Cable.find_by(id: params["id"])
    @reference = @cable
    @cable.destroy

    render json: {message: "#{@reference.name} has been removed from the database."}
  end 

end
