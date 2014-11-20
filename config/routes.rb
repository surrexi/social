Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' },
  controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  concern :commentable do
    resources :comments, only: [:create, :destroy]
  end

  concern :image_attachable do
    resources :photos
  end

  resources :activities

  resources :users do
    resources :walls, concerns: [:commentable, :image_attachable]
  end

  resources :albums do
    resources :photos, concerns: :commentable do
      member do
        put "vote", to: "photos#vote"
      end
    end
  end

  root 'activities#index'
end
