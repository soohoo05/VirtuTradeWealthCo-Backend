class UserCrypto < ApplicationRecord
  belongs_to :user_id
  belongs_to :crypto_id
end
