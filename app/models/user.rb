class User < ApplicationRecord
  has_many :trading_systems, dependent: :destroy
  validates :email, :password, presence: true
  validates :password_confirmation, presence: true, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  validates_confirmation_of :password
end
