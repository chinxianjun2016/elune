Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders do
    collection do
      post 'import'
      get 'baiduMap'
    end
  end
  # resources :items
  resources :teams
end
