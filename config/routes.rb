Rails.application.routes.draw do
  #get 'purchases/new'
  #get 'purchases/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'items#index'

  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :purchases, only: [:index, :create, :new, :show]
  end

  resources :categories, only: [:show]
  # Defines the root path route ("/")
  # root "articles#index"
end
