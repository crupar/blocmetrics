Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  get 'about' => 'welcome#about'
  resources :welcome
  resources :user



end
