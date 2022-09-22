Rails.application.routes.draw do
  devise_for :users do
  end
  
  resources :lists do
    resources :bookmarks, shallow: true, only: [:new, :create, :destroy]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
