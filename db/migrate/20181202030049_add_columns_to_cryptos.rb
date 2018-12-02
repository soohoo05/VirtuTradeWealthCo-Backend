class AddColumnsToCryptos < ActiveRecord::Migration[5.2]
  def change
    add_column :cryptos, :name, :string
    add_column :cryptos, :symbol, :string
    add_column :cryptos, :website_slug, :string
    add_column :cryptos, :rank, :integer
    add_column :cryptos, :circulating_supply, :integer
    add_column :cryptos, :total_supply, :integer
    add_column :cryptos, :max_supply, :integer
    add_column :cryptos, :price, :float
    add_column :cryptos, :volume, :float
    add_column :cryptos, :market_cap, :float
    add_column :cryptos, :user_id, :integer
  end
end
