Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get "/all" => "cables#display_all"
    get "/one_product" => "cables#one_product"
    get "/one_product/:id" => "cables#one_product"
  end 
  
end
