Rails.application.routes.draw do

  root 'static_pages#home'

  get  '/search', to: "static_pages#search"

  get  '/dashboard', to: "users#dashboard"

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users

end
