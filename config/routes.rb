Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do

      resources :users do
        get :friends, to: 'users/friends#index'
      end
      
      post 'users/games', to: 'users/games#create'

      resources :games, only: [:create]
    end
  end
end
