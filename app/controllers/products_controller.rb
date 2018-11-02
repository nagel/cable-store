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

  def update

    @cable = Cable.find_by(id: params[:id])

    @cable.update({ #Falsey logic not needed since the edit html.erb calls the current value into the text fields
      name: params["name"],
      price: params["price"],
      length: params["length"],
      function: params["function"],
      model_year: params["model_year"],
      description: params["description"],
      in_stock: params["in_stock"],
      vendor_id: params["vendor"]
    })

    render "show.html.erb"

  end 

  def destroy
    @cable = Cable.find_by(id: params[:id])
    @cable.destroy
    redirect_to "/products"
  end 

end
