Rails.application.routes.draw do
  resources :users do
    resources :posts do
      resources :comments do
        resources :comments
      end
    end
    resources :photos
    resources :friendships
    resources :friendship_requests
  end
  get '/main_page', to: 'posts#main_page'
  root 'posts#main_page'
end
