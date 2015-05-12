Rails.application.routes.draw do
  get 'welcome/index'
  
  get 'about' => 'welcome#about'
  get 'items' => 'welcome#items'

  devise_for :users
  resources :users, only: [:update, :show, :index]
    resources :items, only: [:create]
  

  root "welcome#index"

end
