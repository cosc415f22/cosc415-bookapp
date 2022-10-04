Rails.application.routes.draw do
  resources :books, only: [:index, :show, :new, :create]
  root "books#index"
end
