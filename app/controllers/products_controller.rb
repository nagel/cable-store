class ProductsController < ApplicationController

  def index

    @cables = Cable.all
    render "index.html.erb"

  end 

  def show 

    @cable = Cable.find_by(id: params[:id])
    render "show.html.erb"

  end

  def new
    render "new.html.erb"
  end 

  def create
    @cable = Cable.new(
      name: params["name"],
      price: params["price"],
      length: params["length"],
      function: params["function"],
      model_year: params["model_year"].to_i,
      description: params["description"],
      in_stock: params["in_stock"],
      vendor_id: params["vendor"]
      )
    
    #SAD route
    if @cable.save
      redirect_to "/products/#{@cable.id}"
    else
      render json: {message: "poop"}
    end
    
  end 

  def edit

    @cable = Cable.find_by(id: params[:id]) #When on the show page, will pull id from the URL
    render "edit.html.erb"

  end


end
