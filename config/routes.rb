Rails.application.routes.draw do
  resources :books, :subjects
  root 'books#index'
end
