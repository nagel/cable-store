class ProductsController < ApplicationController

  def index

    @cables = Cable.all
    render "index.html.erb"

  end 

  def show 

    @cable = Cable.find_by(id: params[:id])
    render "show.html.erb"

  end

end
