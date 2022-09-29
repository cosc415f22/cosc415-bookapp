Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  root "books#index"
end
