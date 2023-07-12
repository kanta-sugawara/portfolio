Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  root to: 'homes#top'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :reviews do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
