Rails.application.routes.draw do
  root to: 'pages#home'
  get "/home", to: "pages#home", as: "home"
  get "/about", to: "pages#about", as: "about"

  devise_for :users do
  end

  resources :lists do
    resources :bookmarks, shallow: true, only: [:new, :show, :create, :destroy] do
    end
  end

  get "/lists/:list_id/bookmarks/search", to: "bookmarks#search", as: "search"

  resources :movies, only: [:show, :index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
