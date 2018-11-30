class User < ApplicationRecord
  has_many :usercryptos
  has_many :cryptos, through :usercryptos
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
