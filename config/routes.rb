Rails.application.routes.draw do
  devise_for :users
  resources :class_videos do
    resources :comments, only: [:create]
  end
  resources :topics do
    resources :comments, only: [:create]
  end
  # resources :users, only: [:show]
  get '~:nickname', to: "users#topics", as: :user_activity
  get '~:nickname/topics', to: "users#topics", as: :user_topics
  get '~:nickname/comments', to: "users#comments", as: :user_comments



  root 'class_videos#index'
end
