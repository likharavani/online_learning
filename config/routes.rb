Rails.application.routes.draw do
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


  get "form" ,to: "users#form"
  get "/add" ,to: "courses#create"
  get "download_pdf", to: "courses#download_certificate"
  get "/addition",to: "courses#addition"

  resources :courses do
    resources :feedbacks, only: [:create]
  end


end
