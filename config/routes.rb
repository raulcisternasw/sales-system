Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Devise Routes
  devise_for :users
  # Users Routes
  resources :users
  # Subscriptions Routes
  resources :subscriptions
  # Products Routes
  resources :products
  # Orders Routes
  resources :orders
  # Webpay Routes
  get '/webpayplus/return_url', to: 'orders#webpay_commit', as: :webpay_commit
end
