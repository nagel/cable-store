class Api::CablesController < ApplicationController

  def display_all

    #@cables is an instance of the Cable class and contains all the data instances (in an array) from the Cable model
    @cables = Cable.all
    render "view.json.jbuilder"

  end 

end
