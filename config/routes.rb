Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ShoppingCart::Engine, at: '/', as: 'cart'
  root 'home#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations' }

  resources :books, only: %i[show index]
  get 'catalog', to: 'books#index'
  resources :reviews, only: :create
  resources :images, only: %i[new create show]
end
