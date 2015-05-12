Rails.application.routes.draw do

  get 'welcome/index'
  
  devise_for :users
  resources :users, only: [:update, :show, :index]
  resources :items, only: [:create, :index]
  

  root "welcome#index"

end
