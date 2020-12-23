Rails.application.routes.draw do
  resources :grimes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'auth/google_oauth2/callback', to: 'sessions#omniauth'
  root to: 'grimes#index'#'pages#home'
end

