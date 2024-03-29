Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create] do
    member do
      get :blogs
      get :followings
      get :followers
    end
  end
  
  resources :questions do
    resources :answers, only: [:create, :destroy]
  end
  
  resources :posts
  
  resources :relationships, only: [:create, :destroy]
end
