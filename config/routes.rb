Rails.application.routes.draw do
  root 'top_pages#home'
  resources :users, only: [:show, :new, :edit, :create, :update] do
    member do
      get :profile
      patch '/profile_update' => 'users#profile_update'
      post '/profile_update' => 'users#profile_update'
    end
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/signup', to:'users#new'
  post '/signup',  to: 'users#create'

  resources :rooms, only: [:show, :new, :index, :create] do
    collection do
      get :search
    end
  end
  resources :reservations, only: [:index, :new, :create, :show]
  get '/reservations' => 'reservations#index'
  get '/lend' => 'reservations#lend'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
