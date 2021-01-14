Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      # Games lookup
      namespace :games do
        get '/find', to: 'find#index'
      end

      # User crud

      resources :users do
        get :friends, to: 'users/friends#index'
        get :games, to: 'users/games#index'
        post :games, to: 'users/games#create'
        delete :games, to: 'users/games#destroy'
        get :game_nights, to: 'users/game_nights#index'
        get :invitations, to: 'users/invitations#index'
      end

      # Games crud
      resources :games, only: [:create]
      resources :game_nights, only: %i[show create update destroy]
      resources :invitations, only: [:update]
    end
  end
end
