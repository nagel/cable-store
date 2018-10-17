class Api::CablesController < ApplicationController

  def index
    #@cables is an instance of the Cable class and contains all the data instances (in an array) from the Cable model
    @cables = Cable.all
    p
    render "index.json.jbuilder"
  end 

  def show
    @cables = Cable.find_by(id: params["id"])

    render "show.json.jbuilder"
  end 

  def create
    cable = Cable.new(
      name: params["name"],
      price: params["price"],
      length: params["length"],
      function: params["function"],
      model_year: params["model_year"],
      description: params["description"])
    cable.save

    render "show.json.jbuilder"
  end 

  def update
    @cables = Cable.find_by(id: params["id"])
    @cables.update(
      name: params["name"] || @cables.name, 
      price: params["price"] || @cables.price,
      length: params["length"] || @cables.length,
      function: params["function"] || @cables.function,
      model_year: params["model_year"] || @cables.model_year,
      image_url: params["image_url"] || @cables.image_url,
      description: params["description"] || @cables.description
    )

    render "show.json.jbuilder"

  end 

  def delete
    @cables = Cable.find_by(id: params["id"])
    @reference = @cables
    @cables.destroy

    render json: {message: "#{@reference.name} has been removed from the database."}
  end 

end
