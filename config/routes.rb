Rails.application.routes.draw do
  devise_for :users
  # root to:'admin/products#index'
  root to: 'products#index'

  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts


  # get 'welcome', to: 'welcome#index'
end
