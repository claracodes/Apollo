Rails.application.routes.draw do
  devise_for :users
  get "dashboard", to: 'bookings#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlx
  resources :events, only: [:show, :index, :new, :edit] do
    resources :bookings, only: [:new, :create, :show]
    collection do                       # collection => no restaurant id in URL
      get '/search', to: "events#search"  # RestaurantsController#top
    end
  end

  root to: 'pages#home'
end
