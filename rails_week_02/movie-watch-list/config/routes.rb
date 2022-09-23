Rails.application.routes.draw do
  root to: 'pages#home'
  get "/home", to: "pages#home", as: "home"
  get "/about", to: "pages#about", as: "about"

  devise_for :users do
  end

  resources :lists do
    resources :bookmarks, shallow: true, only: [:new, :show, :create, :destroy] do
      resources :movies, shallow: true, only: [:show]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
