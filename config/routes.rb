Rails.application.routes.draw do
  resources :books, :subjects
  match ':controller(/:action(/:id))(.:format)', via: [:get, :post]
  match ':controller/:action', via: [:get, :post]
  get '/login', to: 'auth#login'
  root 'books#index'
end
