class Api::CablesController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]

  def index
    #@cables is an instance of the Cable class and contains all the data instances (in an array) from the Cable model
    @cables = Cable.all

    if params[:category]
      category = Category.find_by(name: params[:category])
      @cables = category.cables
    end

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
    
    if current_user
      render "index.json.jbuilder"
    else
      render json: {message: "PLEASE LOGIN!"}
    end 

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
      in_stock: params["in_stock"],
      vendor_id: params["vendor"])
    @cable.save

    if @cable.save
      Image.create(
        url: params["url"],
        cable_id: @cable.id)
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
      description: params["description"] || @cable.description,
      in_stock: params["in_stock"] || @cable.in_stock,
      vendor_id: params["vendor"] || @cable.vendor_id
    )

    if @cable.save
      Image.create(
        url: params["url"] || @image.url,
        cable_id: @cable.id || @image.cable_id)
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
