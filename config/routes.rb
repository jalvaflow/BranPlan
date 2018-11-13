Rails.application.routes.draw do

  resources :sections
  resources :section_instructors
  resources :course_requirements
  resources :section_times
  resources :course_subjects
  resources :subjects
  resources :courses
  resources :segments
  resources :terms
  resources :instructors
  resources :requirements
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
