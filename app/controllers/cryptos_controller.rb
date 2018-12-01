class CryptosController < ApplicationController

  def index
    #require 'pry'; binding.pry
    response = RestClient.get("https://api.binance.com/api/v1/ticker/24hr")
    json_response = JSON.parse(response.body)
    render json: {"currencies": json_response}
  end

  def show
    symbol = params['id']
    response = RestClient.get("https://api.binance.com/api/v1/ticker/24hr?symbol=#{symbol.upcase}")
    json_response = JSON.parse(response.body)
    render json: {"currencies": json_response}
  end

end
