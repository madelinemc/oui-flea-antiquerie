Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :antiques
  resources :markets do
    resources :antiques, only: [:index, :new, :create]
  end
  
  resources :users

  resource :sessions #, only: [:new, :create, :destroy]
  get '/', to: 'sessions#home', as: "home"
  get '/about', to: 'sessions#about', as: "about"
  get '/auth/:provider/callback', to: 'sessions#omniauth'

end
