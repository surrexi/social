Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :users
  resources :activities

  resources :albums do
    resources :photos do
      resources :comments, only: [:create, :destroy]
    end
  end

  root 'activities#index'
end
