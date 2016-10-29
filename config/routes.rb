Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :categories
  resources :purchases

  root 'pages#home'

  get 'profile' => 'pages#profile'

  get 'dashboard' => 'purchases#dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
