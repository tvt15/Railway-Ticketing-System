Rails.application.routes.draw do
  resources :trains
  resources :passengers
  resources :reviews
  resources :tickets
  resources :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'passenger_show_route', to: 'admins#passenger_show', as: 'passenger_show_route'
  get 'train_show_route', to: 'admins#train_show', as: 'train_show_route'
  get 'ticket_show_route', to: 'admins#ticket_show', as: 'ticket_show_route'
  get 'review_show_route', to: 'admins#review_show', as: 'review_show_route'

  get 'ptrain_show_route', to: 'passengers#ptrain_show', as: 'ptrain_show_route'
  get get 'newtrain', to: "trains#new", as: 'newtrain'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: "passengers#new", as: 'signup'
  get 'alogin', to: "sessions#anew", as: 'alogin'
  get 'plogin', to: "sessions#pnew", as: 'plogin'
  get 'logout', to: "sessions#destroy", as: 'logout'
  # Defines the root path route ("/")
  # root "articles#index"
end
