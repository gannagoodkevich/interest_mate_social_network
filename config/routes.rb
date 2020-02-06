Rails.application.routes.draw do
  resources :users do
    resources :posts do
      resources :comments do
        resources :comments
      end
      get '/comments/reply_on_comment', to: 'comment#reply_on_comment'
    end
    resources :photos
  end
  get '/main_page', to: 'posts#main_page'
  root 'posts#main_page'
end
