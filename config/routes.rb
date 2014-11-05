Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' },
  controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users
  resources :activities

  resources :albums do
    resources :photos do
      member do
        put "vote", to: "photos#vote"
      end
      resources :comments, only: [:create, :destroy]
    end
  end

  root 'activities#index'
end
