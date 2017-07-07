Rails.application.routes.draw do
  get 'homes/dashborad'

  devise_for :users
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders do
    collection do
      post 'import'
      get 'baidu_map'
      get 'dispatch_list'
      get 'finished_list'
      get 'current'
    end
  end

  # get '/orders/dispatch/:id', to: 'orders#dispatch'
  # resources :items
  resources :teams

  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end

  root 'homes#dashboard'
end
