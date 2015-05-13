Rails.application.routes.draw do

  get 'welcome/index'
  
  devise_for :users
  resources :users, only: [:update, :show, :index]
  
  resources :lists do
    resources :items, only: [:create, :index]
  end

  root "welcome#index"

end
