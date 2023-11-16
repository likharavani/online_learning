Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'feedbacks/index'
  get 'feedbacks/create'
  get 'feedbacks/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'

  end
  # Defines the root path route ("/")
  root "home#index"
  resources  :home
  resources :users,:courses

  get "/course/add" ,to: "courses#add_course_to_user"
  get "download_certificate", to: "courses#download_certificate"
  get "/update_user_progress",to: "courses#update_user_progress"

  resources :courses do
    resources :feedbacks, only: [:create]
  end

  namespace :api do
    namespace :v1 do
      resources :courses do
        resources :feedbacks, only: [:create]
      end
      resources  :users, :courses, :feedbacks, :pdfs, :home
      post "/login", to: "users#login"
      get "/logout", to: "users#logout"
      get "/course/add" ,to: "courses#add_course_to_user"
      get "download_certificate", to: "courses#download_certificate"
      get "/update_user_progress",to: "courses#update_user_progress"
    end
  end

end
