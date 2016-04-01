Rails.application.routes.draw do
  resources :class_videos
  root 'class_videos#index'
end
