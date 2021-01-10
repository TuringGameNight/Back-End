Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Friends
  namespace :api do
    namespace :v1 do

      resources :users do
        get :friends, to: 'users/friends#index'
      end

      resources :games do
        post :games, to: 'games/games#create'
      end

      resources :game_nights
    end
  end
end

# The follow was tried but gives too much crud functionality for a user
# Games
# namespace :api do
#   namespace :v1 do
#     resources :users do
#       get :games, to: 'users/games#new'
#       post :games, to: 'users/games#create'
#     end
#   end
# end
