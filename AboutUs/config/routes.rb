Rails.application.routes.draw do

  resources :images
  resources :users

  get 'pages/index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #This sets root page to index.
  root 'pages#index'
  get "/pages/:page" => "pages#show"

end
