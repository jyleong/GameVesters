class Stock < ApplicationRecord

	has_many :user_stocks
	has_many :transactions
	has_many :users, through: :user_stocks

	def self.find_by_symbol(ticker_symbol)
		retrievedStock = where(symbol: ticker_symbol.upcase).first
		looked_up = StockQuote::Stock.quote(ticker_symbol)


		if (retrievedStock)
			retrievedStock.update(current_price: looked_up.ask.nil? ? 0: looked_up.ask,
			amount_change: looked_up.change.nil? ? 0: looked_up.change,
			year_high: looked_up.year_high,
			year_low: looked_up.year_low,
			percent_change: looked_up.percent_change
			)
			retrievedStock.save
		end
		return retrievedStock
	end

	def self.new_from_lookup(ticker_symbol)
		looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
		return nil unless looked_up_stock.name
		
		ticker_symbol.upcase!
		request_url = "https://api.intrinio.com/companies?ticker=#{ticker_symbol}"
		response = HTTParty.get(request_url, :basic_auth => AUTH)
		puts response
		body = JSON.parse(response.body)

		
		@new_stock = Stock.create(symbol: looked_up_stock.symbol, 
			name: looked_up_stock.name, 
			current_price: looked_up_stock.ask,
			amount_change: looked_up_stock.change.nil? ? 0: looked_up_stock.change,
			year_high: looked_up_stock.year_high,
			year_low: looked_up_stock.year_low,
			percent_change: looked_up_stock.percent_change,
			description: body["short_description"]
			)

		##debugger
		@new_stock.save
		@new_stock
	end

	def price
		closing_price = StockQuote::Stock.quote(symbol)

		return "#{closing_price.previous_close} (Closing)" if closing_price.previous_close ## basicalyl if not nill

		opening_price = StockQuote::Stock.quote(symbol)
		return "#{opening_price.open} (Opening)" if opening_price.open
	'Unavailable'
	end

	def compareTime()
    	currentTime = DateTime.now
    	return ((currentTime.to_i - updated_at.to_i)/3600 > 0)
	end
end
