Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :vehicles, only: %i[index new create show]

  resources :bookings, only: %i[index new create show]

  get '/mapper', to: 'vehicles#mapper', as: 'map'

end
