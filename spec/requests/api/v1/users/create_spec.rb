require 'rails_helper'

RSpec.describe 'Create User' do
  it "can create a new user" do
    user = create(:user)
    user_params = {:client_id=>user.id,
                   :user_data=>
                      {:info=>
                        {:name=>user.name,
                        :email=>user.email,
                        :image=>user.image
                        },
                      :credentials=>
                        {:token=>user.google_token,
                        :refresh_token=>user.refresh_token
                        },
                      :extra=>
                        {:id_token=>user.auth_token
                        }
                      }
                  }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    user = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    user_response_checker(user, User.last)
  end
end
