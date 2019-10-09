Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks" }
  namespace :api do
    namespace :v1 do
      resources :playlists
      resources :sessions, only: [:create, :destroy]
      resources :users
      #TODO add devise routes so devise can create users on callback
      resources :tracks do
        collection do
          get :top_100
          get :random
          get :search
        end
      end
    end
  end
  get '/auth/spotify/callback', to: 'api/v1/users#spotify'
end
