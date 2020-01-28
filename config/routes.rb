Rails.application.routes.draw do
  resources :users do
    resources :posts do
      collection do
        get 'display_main_page'
      end
    end
  end
  root 'users#welcome'
end
