Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :roles

      root to: "users#index"
    end

  devise_for :users
  get 'persons/profile', as: 'user_root'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  resources :products
end
