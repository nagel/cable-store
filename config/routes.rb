Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get "/cables" => "cables#index" #show all cables
    get "/cables/:id" => "cables#show" #show cable based on URL segment variable
    post "/cables" => "cables#create" #adds cable to database
    patch "/cables/:id" => "cables#update" #updates data in database 
    delete "/cables/:id" => "cables#delete" #deletes item from database
  end 
  
end
