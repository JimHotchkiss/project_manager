Rails.application.routes.draw do

  resources :tasks
  root 'static#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # OAurth
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  resources :developers
  resources :technologies
  resources :projects

  resources :projects do 
    resources :tasks 
  end 

  resources :developers do 
    resources :projects 
  end 
  
end
