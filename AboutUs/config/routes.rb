Rails.application.routes.draw do
<<<<<<< HEAD
	get 'pages/index'
=======
  get 'pages/index'
>>>>>>> b439d74558a4e86b847d5f52112aad3328342bf2
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get "/pages/:page" => "pages#show"
end