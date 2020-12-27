Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:index]

  get '/antiques', to: 'antiques#index'
  get '/antiques/:id', to: 'antiques#show'
  get '/antiques/new', to: 'antiques#new'
  post '/antiques', to: 'antiques#create'
  get '/antiques/:id/edit', to: 'antiques#edit'
  patch '/antiques/:id', to: 'antiques#update'
  delete '/antiques/:id/delete', to: 'antiques#destroy'

  resources :markets

end
