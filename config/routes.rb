Rails.application.routes.draw do

  # FB connect
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get "dashboard", to: 'bookings#dashboard'
  get "hostdashboard", to: 'events#hostdashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlx
  resources :events, only: [:show, :index, :new, :edit, :destroy] do
    resources :bookings, only: [:new, :create, :show]
    collection do                       # collection => no restaurant id in URL
      get '/search', to: "events#search"  # RestaurantsController#top
    end
  end

  resources :venues, only: [:index, :edit]

  root to: 'pages#home'
end
