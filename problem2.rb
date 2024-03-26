require 'httparty'
require 'json'

def track_cryptocurrency_prices
  response = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")
  cryptocurrencies = JSON.parse(response.body)

  sorted_cryptos = cryptocurrencies.sort_by { |crypto| -crypto['market_cap'] }

  puts "Top 5 Cryptocurrencies by Market Capitalization:"
  sorted_cryptos.first(5).each do |crypto|
    puts "#{crypto['name']}: $#{crypto['current_price']} (Market Cap: $#{crypto['market_cap']})"
  end
end

track_cryptocurrency_prices
