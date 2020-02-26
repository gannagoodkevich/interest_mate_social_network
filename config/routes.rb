Rails.application.routes.draw do
  devise_for :users, controllers: {
      :sessions => "users/sessions",
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  authenticated :user do
    root 'posts#main_page', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'users/sessions#new'
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
    patch 'birthday_update', to: 'users#birthday_update'
    resources :addresses
  end
  resources :tags do
    collection do
      get :autocomplete
    end
  end
  get '/main_page', to: 'posts#main_page'
  get '/main_page/search', to: 'posts#search'
    #root 'posts#main_page'
end
