class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :jwt_authenticatable,
         :recoverable, :rememberable, :validatable, jwt_revocation_strategy: JwtDenylist, 
         authentication_keys: [:email]
  validates :first_name, :last_name, presence: true

  enum status: { created: 0, active: 1 }
end
