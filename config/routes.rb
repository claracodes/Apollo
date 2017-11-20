Rails.application.routes.draw do
  get 'events/show'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlx
  resources :events, only: [:show]
  get '/search', to: 'events#search'

end
