Rails.application.routes.draw do

  resources :degrees
  resources :section_times
  resources :events
  resources :enrollments
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :sections
  resources :section_instructors
  resources :course_requirements
  resources :course_subjects
  resources :subjects
  resources :courses
  resources :segments
  resources :terms
  resources :instructors
  resources :requirements
  root 'static_pages#home'

  get  '/search', to: "static_pages#search"

  get  '/contact', to: "messages#new"
  post  '/contact', to: 'messages#create'

  get  '/dashboard', to: "users#dashboard"

  put    '/enroll', to: 'enrollments#enroll'
  put    '/unenroll', to: 'enrollments#unenroll'

  put    '/add_course', to: 'user_course_history#add_course'
  put    '/remove_course', to: 'user_course_history#remove_course'

  get  '/edit', to: "users#edit"

  resources :users

end
