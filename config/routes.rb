Rails.application.routes.draw do
  resources :books

  get 'books/index'
  get 'books/new'
  post 'books/create'
  patch 'books/update'
  get 'books/list'
  get 'books/show'
  get 'books/edit'
  get 'books/delete'
  get 'books/update'

  root 'books#index'
end
