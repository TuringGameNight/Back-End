# frozen_string_literal: true

module ResponseCheckers
  def user_response_checker(user_response, user)
    expect(user_response).to be_a(Hash)

    expect(user_response[:data]).to be_a(Hash)

    expect(user_response[:data]).to have_key(:id)
    expect(user_response[:data][:id]).to be_a(String)
    expect(user_response[:data][:id].to_i).to eq(user.id)

    expect(user_response[:data]).to have_key(:type)
    expect(user_response[:data][:type]).to be_a(String)
    expect(user_response[:data][:type]).to eq('user')
    expect(user_response[:data][:type].capitalize).to eq(user.class.to_s)

    expect(user_response[:data]).to have_key(:attributes)
    expect(user_response[:data][:attributes]).to be_a(Hash)

    expect(user_response[:data][:attributes]).to have_key(:id)
    expect(user_response[:data][:attributes][:id]).to be_an(Integer)
    expect(user_response[:data][:attributes][:id].to_i).to eq(user.id)

    expect(user_response[:data][:attributes]).to have_key(:name)
    expect(user_response[:data][:attributes][:name]).to be_a(String)
    expect(user_response[:data][:attributes][:name]).to eq(user.name)

    expect(user_response[:data][:attributes]).to have_key(:email)
    expect(user_response[:data][:attributes][:email]).to be_a(String)
    expect(user_response[:data][:attributes][:email]).to eq(user.email)

    expect(user_response[:data][:attributes]).to have_key(:image)
    expect(user_response[:data][:attributes][:image]).to be_a(String)
    expect(user_response[:data][:attributes][:image]).to eq(user.image)

    expect(user_response[:data]).to have_key(:relationships)
    expect(user_response[:data][:relationships]).to be_a(Hash)

    expect(user_response[:data][:relationships]).to have_key(:buds)
    expect(user_response[:data][:relationships][:buds]).to be_a(Hash)

    expect(user_response[:data][:relationships][:buds]).to have_key(:data)
    expect(user_response[:data][:relationships][:buds][:data]).to be_an(Array)
  end
end
