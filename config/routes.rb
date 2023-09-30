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
  
  get 'trainstation_filter_route', to: "trains#trainstation_filter", as: "trainstation_filter_route"
  get 'filter_by_rating', to:"trains#filter_by_rating", as: 'filter_by_rating'
  get 'search_passenger_by_train_number', to:"passengers#search_passenger_by_train_number", as: 'search_passenger_by_train_number'
  get 'search_review_by_train_number', to:"reviews#search_review_by_train_number", as: 'search_review_by_train_number'
  get 'search_review_by_passenger_name', to:"reviews#search_review_by_passenger_name", as: 'search_review_by_passenger_name'
  get 'pbooking_route', to: 'passengers#pbooking', as: 'pbooking_route'
  get 'booking_show_route', to: 'passengers#booking_show', as: 'booking_show_route'
  get 'ptrain_show_route', to: 'passengers#ptrain_show', as: 'ptrain_show_route'
  get 'pshow_reviews_route', to: 'reviews#pshow_reviews', as: 'pshow_reviews_route'
  get 'newtrain', to: "trains#new", as: 'newtrain'
  get 'newticket', to: "tickets#new", as: 'newticket'
  get 'newreview', to: "reviews#new", as: 'newreview'

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: "passengers#new", as: 'signup'
  get 'alogin', to: "sessions#anew", as: 'alogin'
  get 'plogin', to: "sessions#pnew", as: 'plogin'
  get 'logout', to: "sessions#destroy", as: 'logout'
  # Defines the root path route ("/")
  # root "articles#index"
end
