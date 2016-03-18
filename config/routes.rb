Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'

  resources :products, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    resources :orders, only: [:index, :show, :create, :destroy]
  end

  post '/users/:id/money', to: 'users#add_money', as: 'add_money'

  root to: "users#index"
end
