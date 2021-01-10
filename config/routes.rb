Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      delete 'users/games', to: 'users/games#destroy'
      post 'users/games', to: 'users/games#create'

      # Games lookup
      namespace :games do
        get '/find', to: 'find#index'
      end

      # User crud
      resources :users do
        get :friends, to: 'users/friends#index'
      end

      # Games crud
      resources :games do
        post :games, to: 'games/games#create'
      end

      resources :game_nights, only: %i[show create]
    end
  end
end
