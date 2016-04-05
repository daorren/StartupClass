Rails.application.routes.draw do
  devise_for :users
  resources :class_videos do
    resources :comments, only: [:create]
  end
  resources :topics do
    resources :comments, only: [:create]
  end

  root 'class_videos#index'
end
