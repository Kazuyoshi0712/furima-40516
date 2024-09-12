Rails.application.routes.draw do
  #get 'purchases/new'
  #get 'purchases/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :categories, only: [:show]

  resources :items do
    resources :purchases, only: [:index, :create, :new, :show]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
