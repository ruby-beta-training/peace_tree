class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def auth_token
    JsonWebToken.encode(user_id: id, user_email: email)
  end

end
