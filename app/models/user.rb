class User < ApplicationRecord

  validates :email, uniqueness: true
  validates :name, :email, presence: { require: true }
  validates :google_id, :google_token, :auth_token, presence: { require: true }

  has_many :game_nights, dependent: :destroy
  has_many :invitations
  has_many :friends, dependent: :destroy
  has_many :buds, through: :friends
  has_many :games

  def self.find_or_update(user_data)
    user = User.find_by(email: user_data[:user_data][:info][:email]) || User.create!(
      google_id: user_data[:client_id],
         name: user_data[:user_data][:info][:name],
          image: user_data[:user_data][:info][:image],
           auth_token: user_data[:user_data][:credentials][:token],
             google_token: user_data[:user_data][:extra][:id_token],
              email: user_data[:user_data][:info][:email]
    )
    user.save
    user
  end
end
