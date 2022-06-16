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
  get 'webpayplus/status/:token', to: 'orders#webpay_status', as: :webpay_status
  post 'webpayplus/refund', to: 'orders#webpay_refund', as: :webpay_refund
end
