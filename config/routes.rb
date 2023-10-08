Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'homes/top'
  root to: 'homes#about'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
   member do
      get :follows, :followers
      get :favorites
    end
      resource :relationships, only: [:create, :destroy]
  end

  resources :reviews do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
