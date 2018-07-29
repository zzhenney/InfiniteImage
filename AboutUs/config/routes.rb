Rails.application.routes.draw do

  #Admin: Redirects admin user to admin panel on login
  constraints Clearance::Constraints::SignedIn.new { |user| user.is_admin? } do
    root to: "admin#image", as: :admin_root
  end

  resources :images do
    collection do
      match 'search' => 'images#search', via: [:get, :post], as: :search
    end
  end
  resources :users
  resources :home



  get 'home/index'
  #get 'pages/index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #This sets root page to index.
  root 'home#index'
  get "pages" => "pages#index"
  get "pages/:page" => "pages#show"
  get 'result' => 'images#result'
  #get "upload" => "home#upload" #Linking upload page route
  get 'upload' => 'images#new' #Joe Phabmixay 7/27/18 -- reroute upload page to images/new => images/_form/ for image controllers 

  #overriding clearance routes
  #clearance / login / registrationgit

  get '/sign_in', to: 'sessions#new', as: nil
  delete "/sign_out" => "sessions#destroy", as: nil
  get "/sign_up" => "users#new", as: nil

  #About Us routes
  get 'pages/index' => 'pages#index'
  get "/pages/:page" => "pages#show"


  #get 'admin' => 'admin#index'

  get 'admin' => 'admin#image'
  get '/image/approve' => "images#approve"



end
