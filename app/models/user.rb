class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :password, :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
end
