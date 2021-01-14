Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      # Games lookup
      namespace :games do
        get '/find', to: 'find#index'
      end

      # User crud
      resources :users, only: [:create] do
        scope module: :users do
          resources :friends, only: [:index, :create, :update, :destroy]
          resources :games, only: [:index, :create, :destroy]
          resources :game_nights, only: [:index]
        end
      end

      # Games crud
      resources :games, only: [:create]
      resources :game_nights, only: %i[show create update destroy]
      resources :invitations, only: [:update]
    end
  end
end
