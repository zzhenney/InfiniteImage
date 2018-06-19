Rails.application.routes.draw do

  get 'pages/index'
  get 'pages/AboutPaul'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #This sets root page to index.
  root 'pages#index'

end
