Rails.application.routes.draw do
  resources :requirements
  resources :section_instructors
  resources :instructors
  resources :courses
  resources :subjects
  resources :terms
  resources :section_times
  resources :sections
  resources :course_subjects
  resources :course_requirements
  resources :segments
  resources :users
  
  root 'static_pages#home'

  get 'help', to: "static_pages#help"
  get 'contact', to: "static_pages#contact"
  get 'about', to: "static_pages#about"

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
