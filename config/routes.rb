Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :spaces do
    resources :bookings, only: [:new, :create]
  end
  get "/listings", to: "spaces#listings"
  get "/dashboard", to: "bookings#listings"
  resources :reviews, only: [:create]
  resources :bookings, only: [:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
