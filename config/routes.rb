Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    #cables controller methods
    ##################################################################
    get "/cables" => "cables#index" #show all cables
    get "/cables/:id" => "cables#show" #show cable based on URL segment variable
    post "/cables" => "cables#create" #adds cable to database
    patch "/cables/:id" => "cables#update" #updates data in database 
    delete "/cables/:id" => "cables#delete" #deletes item from database
    ##################################################################

    #users controller methods
    ##################################################################
    post "/users" => "users#create"
    ##################################################################

    #sessions controller methods
    ##################################################################
    post "/sessions" => "sessions#create"
    ##################################################################

    #orders controller methods
    ##################################################################
    get "/orders" => "orders#index"
    post "/orders" => "orders#create"
    ##################################################################

    #carted_products controller methods
    ##################################################################
    get "/cart" => "carted_products#index"
    post "/cart" => "carted_products#create"
    delete "/cart" => "carted_products#delete"
    ##################################################################

  end 

  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  
end
