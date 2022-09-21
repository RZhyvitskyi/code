Rails.application.routes.draw do
  get 'bookmarks/new'
  devise_for :users do
  end
  
  resources :lists

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
