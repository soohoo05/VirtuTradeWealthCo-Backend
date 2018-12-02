class AssetsController < ApplicationController
  before_action :authenticate_user

  def index
    @assets = current_user.assets
    if @assets.any?
      render json: @assets
    else
      render json: {error: 'User has no crypto assets'}
    end
  end

  def create
    #require 'pry'; binding.pry

    @asset = current_user.assets.new(crypto_params)
    if @asset.save
      render json: @asset
    else
      render json: {"error": @asset.errors.full_messages}, status: 422
    end    
  end  

  private

  def crypto_params
    params.permit(:name, :symbol, :website_slug, :rank, :circulating_supply, :total_supply, :max_supply, :price, :volume, :market_cap)
  end
end