Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/items'

  devise_for :users
  resources :users, only: [:update, :show, :index] do
    resources :items, only: [:create], controller: 'items'
  end

  root "welcome#index"

end
