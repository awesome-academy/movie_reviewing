Rails.application.routes.draw do
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  mount Ckeditor::Engine => "/ckeditor"
  root "pages#home"
  get "pages/home"
  get "pages/about"
  get "pages/help"
  get "/signup",  to: "users#new"
  get "/login",   to: "sessions#new"
  get :index, controller: :searchs
  post "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  resources :account_activations, only: [:edit]
  resources :sessions, only: [:create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users, except: [:index]
  resources :post_reviews, except: [:index] do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :bookings, only: [:index, :create, :destroy]
  resources :films, only: [:show]
  resources :ratings, only: [:create, :update, :destroy]
  resources :requests

  namespace :admin do
    root "admin#index"
    resources :films
    resources :post_reviews, except: [:show]
    resources :users, only: [:index, :destroy]
    resources :bookings, only: [:index, :destroy]
    resources :comments, only: [:index, :destroy]
  end
end
