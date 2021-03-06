Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help',     to: 'static_pages#help'
  get  '/home',     to: 'static_pages#home'
  get  '/about',    to: 'static_pages#about'
  get  '/contact',  to: 'static_pages#contact'
  get  '/signup',   to: 'users#new'
  resources :users

  #session routes 
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end