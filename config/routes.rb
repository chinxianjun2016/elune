Rails.application.routes.draw do
  resources :orders do
    collection do
      get 'uploadFile'
    end
  end
  resources :items
  resources :teams
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
