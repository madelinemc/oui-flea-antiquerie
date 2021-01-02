Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:index]

  # get '/antiques', to: 'antiques#index'
  # get '/antiques/new', to: 'antiques#new'
  # get '/antiques/:id', to: 'antiques#show'
  # post '/antiques', to: 'antiques#create'
  # get '/antiques/:id/edit', to: 'antiques#edit'
  # patch '/antiques/:id', to: 'antiques#update'
  # delete '/antiques/:id/delete', to: 'antiques#destroy'
  resources :antiques
  resources :markets do
    resources :antiques, only: [:index, :new, :create]
  end
  
 
  resources :users, except: [:destory]

  resources :sessions, only: [:new, :create, :destory]
  get '/', to: 'sessions#home', as: "home"
  get '/about', to: 'sessions#about', as: "about"

end
