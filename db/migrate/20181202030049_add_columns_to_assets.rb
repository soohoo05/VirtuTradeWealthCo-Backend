class AddColumnsToAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :assets, :name, :string
    add_column :assets, :symbol, :string
    add_column :assets, :website_slug, :string
    add_column :assets, :rank, :integer
    add_column :assets, :circulating_supply, :integer
    add_column :assets, :total_supply, :integer
    add_column :assets, :max_supply, :integer
    add_column :assets, :price, :float
    add_column :assets, :volume, :float
    add_column :assets, :market_cap, :float
    add_column :assets, :user_id, :integer
  end
end
