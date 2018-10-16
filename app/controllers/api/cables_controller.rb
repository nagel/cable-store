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

end
