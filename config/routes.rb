Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    resources :coffees, only: [:index, :create]
  end

  post '/users/:id/money', to: 'users#add_money', as: 'add_money'

  root to: "users#index"
end
