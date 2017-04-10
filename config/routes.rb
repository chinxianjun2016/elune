Rails.application.routes.draw do
  get 'homes/dashborad'

  devise_for :users
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders do
    collection do
      post 'import'
      get 'baidu_map'
    end
  end
  # resources :items
  resources :teams

  root 'homes#dashboard'
end
