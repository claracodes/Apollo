Rails.application.routes.draw do


  devise_for :users, controllers: {
        sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks' }
  get "calendar", to: "calendar#bookings"
  get 'dashboard', to: 'bookings#index', as: 'dashboard'
  get 'dashboard/calendar', to: 'bookings#calendar', as: 'dashboard_calendar'
  get 'dashboard/bookmarks', to: 'bookings#bookmark', as: 'dashboard_bookmarks'
  get "hostdashboard", to: 'events#hostdashboard' #we can get rid of that
  get "bookings/:id", to: 'bookings#show', as: :booking
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlx
  resources :events, only: [:show, :index, :new, :edit, :destroy] do
    resources :bookings, only: [:new, :create] do
      member do
        get '/payment', to: "bookings#payment", as: :payment
      end
    end
    collection do                       # collection => no restaurant id in URL (member has it)
      get '/search', to: "events#search"  # RestaurantsController#top
    end
  end

  resources :venues, only: [:index, :edit]

  root to: 'pages#home'
end
