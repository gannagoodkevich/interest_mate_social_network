Rails.application.routes.draw do
  resources :users do
    resources :posts
    resources :photos
  end
  get '/main_page', to: 'posts#main_page'
  root 'posts#main_page'
end
