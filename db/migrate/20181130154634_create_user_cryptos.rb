class CreateUserCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cryptos do |t|
      t.references :user_id, foreign_key: true
      t.references :crypto_id, foreign_key: true

      t.timestamps
    end
  end
end
