Rails.application.routes.draw do
  resources :books, :subjects
  match ':controller(/:action(/:id))(.:format)', via: [:get, :post]
  root 'auth#login'
end
