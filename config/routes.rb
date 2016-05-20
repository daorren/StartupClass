Rails.application.routes.draw do
  devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)

  devise_for :users
  # resources :users


  resources :class_videos do
    resources :comments, only: [:create]
  end
  resources :topics do
    resources :comments, only: [:create]
  end

  # 个人主页
  get '~:nickname', to: "users#topics", as: :user_activity
  get '~:nickname/topics', to: "users#topics", as: :user_topics
  get '~:nickname/comments', to: "users#comments", as: :user_comments
  # 编辑个人信息
  get 'settings/account', to: "users#account"
  get 'settings/password', to: "users#password"
  get 'settings/profile', to: "users#profile"
  get 'settings/notifications', to: "users#notifications"
  patch 'settings/update_user', to: "users#update_user"



  root 'class_videos#index'
end
