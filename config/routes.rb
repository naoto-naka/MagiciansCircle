Rails.application.routes.draw do
  namespace :end_user do
    get 'contacts/new'
    get 'contacts/create'
  end
  namespace :end_user do
    get 'categories/index'
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :end_user do
    root 'posts#top'
    get 'about' => 'posts#about'
    get 'video/favorite/:id' => 'favorites#favorite',as: "favorite_video"
    post 'video/:id/count' => 'videos#count',as: "video_count"
    resources :contacts,only: [:new,:create]
    resources :events
    resources :categories,only: [:index]
    resources :favorites,only: [:index,:new,:show,:edit,:update]
    resources :videos
      resources :video_ratings do
        resources :reply_comments
    end
    resources :tags,only: [:create,:index,:destroy] do
      post 'add' => 'tags#index'
    end
    devise_scope :end_user do
      get 'mypage' => 'registrations#mypage'
      get 'myvideos' => 'registrations#myvideos'
    end
  end
end
