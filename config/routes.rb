Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new, :create, :edit, :update]

  post '/users/:id/coffees', to: 'users#add_coffee', as: 'add_coffee'
  post '/users/:id/money', to: 'users#add_money', as: 'add_money'

  root to: "users#index"
end
