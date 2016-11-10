class Stock < ApplicationRecord

	has_many :user_stocks
	has_many :users, through: :user_stocks

	def self.find_by_symbol(ticker_symbol)
		where(symbol: ticker_symbol).first
	end

	def self.new_from_lookup(ticker_symbol)
		looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
		return nil unless looked_up_stock.name
		puts looked_up_stock.name
		puts looked_up_stock.response_code
		puts looked_up_stock.ask
		puts looked_up_stock.previous_close
		@new_stock = new(symbol: looked_up_stock.symbol, name: looked_up_stock.name)
		##debugger
		
		@new_stock.current_price = @new_stock.price ##
		
		@new_stock
	end

	def price
		closing_price = StockQuote::Stock.quote(symbol)

		return "#{closing_price.previous_close} (Closing)" if closing_price.previous_close ## basicalyl if not nill

		opening_price = StockQuote::Stock.quote(symbol)
		return "#{opening_price.open} (Opening)" if opening_price.open
	'Unavailable'
	end
end
