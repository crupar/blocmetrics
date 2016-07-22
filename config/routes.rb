Rails.application.routes.draw do

  devise_for :users
  get 'about' => 'welcome#about'


  resources :registered_applications

  authenticated :user do
    root to: 'welcome#index', as: :authenticated_root
  end
  root 'welcome#index'

  

end
