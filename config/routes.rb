Rails.application.routes.draw do

  root 'static#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :developers
  resources :technologies
  resources :projects

  resources :developers do 
    resources :projects 
  end 
  
end
