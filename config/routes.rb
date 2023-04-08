Rails.application.routes.draw do
  devise_for :users
  resources :journal_entries
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  
  post '/users/sign_in', to: 'user#sign_in'
  delete '/users/sign_out', to: 'users#sign_out'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
