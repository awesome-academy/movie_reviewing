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
  get "/search", to: "searchs#index"
  post "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  resources :account_activations, only: [:edit]
  resources :sessions, only: [:create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users
  resources :post_reviews, except: [:index] do
    resources :comments
  end
  resources :bookings, only: [:index, :create, :destroy]
  resources :films, only: [:show]
  resources :ratings, only: [:create, :update, :destroy]

  namespace :admin do
    root "admin#index"
    resources :films
    resources :post_reviews
  end
end
