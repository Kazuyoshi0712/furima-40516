Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'items#index'

  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy ] do
    resources :orders, only: [:index, :create, :new]
  end
 
  # Defines the root path route ("/")
  # root "articles#index"
end
