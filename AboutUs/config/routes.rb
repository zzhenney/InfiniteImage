Rails.application.routes.draw do

  resources :images
  resources :users
  resources :home

  get 'home/index'
  #get 'pages/index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #This sets root page to index.
  root 'home#index'
  get "/home/:page" => "pages#show"
  get 'result' => 'images#result'
  get 'admin' => 'admin#index'
end
