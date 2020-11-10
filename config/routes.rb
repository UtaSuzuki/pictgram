Rails.application.routes.draw do
  root 'pages#index'

  get  'pages/help'
  get  'sessions/new'
  get  'favorites/index'
  post '/favorites', to: 'favorites#create'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :topics
end
