Rails.application.routes.draw do

  resources :user_degrees
  resources :degrees_users
  resources :degrees
  resources :section_times
  resources :events
  resources :enrollments do
    post :enroll, on: :collection
    post :unenroll, on: :collection
    # or you may prefer to call this route on: :member
  end

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
  resources :static_pages do
    get :search, on: :collection
  end

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

  resources :users do
    get :add_degree, on: :collection
    get :remove_degree, on: :collection
    get :add_course_code, on: :collection
    get :remove_course_code, on: :collection
    get :pe_req_check, on: :collection
    get :fl_req_check, on: :collection
    # or you may prefer to call this route on: :member
  end

end
