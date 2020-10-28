Rails.application.routes.draw do
  devise_for :users
  # root to:'admin/products#index'
  root to: 'products#index'
  namespace :admin do
    resources :products
  end
  resources :products
  # get 'welcome', to: 'welcome#index'
end
