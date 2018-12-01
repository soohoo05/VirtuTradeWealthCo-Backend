class CreateUserCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cryptos do |t|
      t.integer :user
      t.integer :crypto

      t.timestamps
    end
  end
end
