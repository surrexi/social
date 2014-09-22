Rails.application.routes.draw do

  resources :users

  root 'welcome#index'


  devise_for :users
end
