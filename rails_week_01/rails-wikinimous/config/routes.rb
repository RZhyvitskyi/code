Rails.application.routes.draw do
  root to: 'articles#index'

  get "/home", to: "pages#home", as: "home"
  get "/about", to: "pages#about", as: "about"

  resources :articles
end
