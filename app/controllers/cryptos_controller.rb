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
    currency_id = params['id']
    response = RestClient.get("https://api.coinmarketcap.com/v2/ticker/#{currency_id}")
    json_response = JSON.parse(response)
    render json: json_response['data']
  end

end
