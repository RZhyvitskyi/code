Rails.application.routes.draw do
  resources :flats do
    resources :reviews, shallow: true, only: %i[create update delete]
  end
end
