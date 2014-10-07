Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :users

  resources :albums do
    resources :photos do
      resources :comments
    end
  end

  root 'welcome#index'
end
