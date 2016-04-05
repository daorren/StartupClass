Rails.application.routes.draw do
  devise_for :users
  resources :class_videos
  resources :topics

  root 'class_videos#index'
end
