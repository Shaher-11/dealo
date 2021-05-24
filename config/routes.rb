Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: %i[index new create show]

  get '/sign-up', to: 'users#new'
  get '/sign-in', to: 'sessions#new'
  post '/sign-in', to: 'sessions#create'
  delete '/sign-out', to: 'sessions#destroy'

end
