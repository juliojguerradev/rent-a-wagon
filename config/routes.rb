Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :vehicles, only: %i[index new create show] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index show]


  get '/mapper', to: 'vehicles#mapper', as: 'map'
  get '/search', to: 'vehicles#search', as: 'search'

end
