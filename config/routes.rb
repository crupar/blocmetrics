Rails.application.routes.draw do

  get 'events/index'

  get 'events/show'

  get 'events/new'

  get 'events/edit'

  devise_for :users
  get 'about' => 'welcome#about'


  resources :registered_applications

  authenticated :user do
    root to: 'welcome#index', as: :authenticated_root
  end
  root 'welcome#index'

  

end
