Rails.application.routes.draw do
  resources :trains
  resources :passengers
  resources :reviews
  resources :tickets
  resources :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'pshow_route', to: 'admins#pshow', as: 'pshow_route'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: "passengers#new", as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  get 'logout', to: "sessions#destroy", as: 'logout'
  # Defines the root path route ("/")
  # root "articles#index"
end
