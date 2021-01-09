require 'rails_helper'

RSpec.describe 'Create User' do
  it "can create a new user" do
    user_request_info = File.read('spec/fixtures/user_oauth_data.rb')
    headers = {'CONTENT_TYPE' => 'application/json'}
    
    post '/api/v1/users', params: user_request_info
    created_user = User.last

    expect(response).to be_successful
    expect(created_user.name).to eq(user_request_info[:user_data][:info][:name])
  end

end
