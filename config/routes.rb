Rails.application.routes.draw do
  
  root to: 'pages#home'
  
  get "/login", to: redirect("auth/google_oauth2")
  get 'auth/google_oauth2/callback', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  get '/auth/failure', to: redirect('/')

  resources :passwords
  resources :session, only: [:create, :destroy]
  resources :grimes
  resources :users
  

end

