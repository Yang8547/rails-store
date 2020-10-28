Rails.application.routes.draw do
  devise_for :users
  root to:'admin/products#index'
  namespace :admin do
    resources :products
  end
  get 'welcome', to: 'welcome#index'
end
