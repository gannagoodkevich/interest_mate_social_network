Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  authenticated :user do
    root 'posts#main_page', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end
  resources :authentications, only: [:destroy]

  resources :users do
    resources :posts do
      resources :comments do
        resources :comments
      end
    end
    resources :interests do
      collection do
        put :update
      end
    end
    resources :photos
    resources :friendships
    resources :friendship_requests
    patch 'users_information', to: 'users#users_information'
    put'update_location', to: 'users#update_location'
    get 'settings', to: 'users#settings'
    get 'birthday_edit', to: 'users#birthday_edit'
    resources :addresses
  end
  resources :tags do
    collection do
      get :autocomplete
    end
  end
  get '/main_page', to: 'posts#main_page'
    #root 'posts#main_page'
end
