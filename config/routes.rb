Rails.application.routes.draw do
  resources :wikis
  resources :charges
  
  devise_for :users
  get 'welcome/about'
  
  root 'welcome#index'
end
