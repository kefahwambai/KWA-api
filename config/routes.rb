Rails.application.routes.draw do
  resources :contributions
  resources :members
  resources :users
  resources :sessions, only: [:create, :destroy]


  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/me', to: 'users#show'  
 
  post '/signup', to: 'members#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/me', to: 'members#show'  
 
end
