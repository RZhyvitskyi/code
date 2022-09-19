Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :reviews, shallow: true, only: %i[new create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'pages#home'

  get "/home", to: "pages#home", as: "home"
  get "/about", to: "pages#about", as: "about"
end
