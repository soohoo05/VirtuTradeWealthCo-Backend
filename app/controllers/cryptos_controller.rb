class CryptosController < ApplicationController

  def index
    #require 'pry'; binding.pry
    response = RestClient.get("https://api.coinmarketcap.com/v2/ticker")
    json_response = JSON.parse(response)
    #arr = [];
    #json_response['data'].each { |k,v| arr.push(v)}
    render json: json_response['data'].map { |k,v| v}
  end

  def show
    #https://api.binance.com/api/v1/ticker/24hr?symbol=#{symbol.upcase}
    #require 'pry'; binding.pry
    currency_id = params['id']
    response = RestClient.get("https://api.coinmarketcap.com/v2/ticker/#{currency_id}")
    json_response = JSON.parse(response)
    render json: json_response['data']
  end

  def create
    require 'pry'; binding.pry
    @crypto = Crypto.create(crypto_params)
    if @crypto.valid?
      render json:@crypto
    else
      render json: {"error": @crypto.errors.full_messages}, status: 422
    end    
  end

  private

  def crypto_params
    params.require(:crypto).permit(:name, :symbol, :website_slug, :rank, :circulating_supply, :total_supply, :max_supply, :price, :volume, :market_cap, :user_id)
  end

end
