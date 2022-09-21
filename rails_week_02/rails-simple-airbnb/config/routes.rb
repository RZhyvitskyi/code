Rails.application.routes.draw do
  root to: 'pages#home'
  get "/home", to: "pages#home", as: "home"
  get "/about", to: "pages#about", as: "about"

  resources :flats do
    resources :reviews, shallow: true, only: %i[create update delete]
  end
end
