class CCurrency < ApplicationRecord
  has_many :usercryptos
  has_many :users, through :usercryptos
end
